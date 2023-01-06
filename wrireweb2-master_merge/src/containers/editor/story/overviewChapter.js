import React from 'react'
import { useNavigate } from 'react-router-dom'

const paid = 'bg-[#29CC97] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]';
const not_paid = 'bg-[#F12B2C] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]'




const OverviewChapter = ({chapterid,name, paid_stt, stt,content}) => {

  const navigate = useNavigate()
 
  async function click_() {
      
      localStorage.setItem('chapterid', chapterid)
      localStorage.setItem('chapter_content', content)
      
      let editorid = localStorage.getItem('editorid')

      let jsonObject = {
        "chapterid": chapterid.replace(/\s/g, ''),
        "editorid": editorid.replace(/\s/g, '')
      }
      // get comment

      let url = "http://localhost:8080/editor/getcomment/"
      const response = await fetch(url, {
        method: "POST",
        body: JSON.stringify(jsonObject),
        headers: {
          "Content-Type": "application/json",
        },
      });
      //return update results 
      const json = await response.json();
      //check chapter have no comment
      if(json.length === 0){
        let jsonCMT = {
          "cmt": "No comment now",
        }
        localStorage.setItem('editor_comment', jsonCMT.cmt)
        console.log(jsonCMT.cmt)
      } else{
        let keys = Object.keys(json[0])
        //check error 
        if (keys[0] === "ERROR") {
          console.log("ERROR: " + JSON.stringify(json[0].ERROR))
        }
        else {
          localStorage.setItem('editor_comment', json[0].cmt) 
        }
      }
      
      navigate('/story/read')
      window.location.reload()
  }
  return (
    <div className='flex h-[60px] border-t items-center' onClick={() => click_()}>
      <div className='text-[14px] font-semibold mx-[40px] w-[100px]'> {name} </div>
      <div className='flex place-content-center w-full h-fit mx-[50px]'>
          <div className= { (paid_stt === 'Paid')? paid:not_paid }>
              {paid_stt}
            </div>   
        </div>
      <div className='text-[14px] font-semibold mx-[50px]'>{stt} </div>

    </div>
  )
}

export default OverviewChapter