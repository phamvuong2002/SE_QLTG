import React from 'react'
import { useNavigate } from 'react-router-dom'

const paid = 'bg-[#29CC97] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]';
const not_paid = 'bg-[#F12B2C] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]'




const OverviewChapter = ({chapterid,name, paid_stt, stt,content}) => {

  const navigate = useNavigate()
 
  async function click_() {
      let jsonObject = {
        "cmt": "No comment"
      }
      localStorage.setItem('chapterid', chapterid)
      localStorage.setItem('chapter_content', content)

      // get comment
      let url = "http://localhost:8080/editor/getcomment/"
      url = url + chapterid 
      const response = await fetch(url);
      const data = await response.json();
      
      if(Object.keys(data[0]) === 'ERROR'){
        // localStorage.setItem('editor_comment',data[0].cmt) 
        console.log("ERROR: " + data[0].ERROR)
      }
      // else if(data[0] === undefined){
      //   // data[0] = jsonObject
      //   localStorage.setItem('editor_comment',JSON.stringify(jsonObject).cmt ) 
      // }
      else{ 
          localStorage.setItem('editor_comment',data[0].cmt) 
      }
      navigate('/story/read')
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