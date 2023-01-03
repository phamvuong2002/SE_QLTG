import React from 'react'
import { useNavigate } from 'react-router-dom'


const OverviewStory = ({storyid, avt, name, process, approve, unpaid, paid}) => {
    //test
    // function timeout(delay) {
    //     return new Promise( res => setTimeout(res, delay) );
    // }
    // {() => navigate('/story/detail')}
    const navigate = useNavigate()
    async function click_(){
        localStorage.setItem('storyid',storyid)
        localStorage.setItem('avt',avt)
        localStorage.setItem('name_content',name)
        localStorage.setItem('unpaid',unpaid)
        localStorage.setItem('paid',paid)
        localStorage.setItem('approve',approve)
        // get chapters
        let url = "http://localhost:8080/author/getallchapterofstory/"
        url = url + storyid 
        const response = await fetch(url);
        const data = await response.json();
        
        if(Object.keys(data[0]) == 'ERROR'){
            localStorage.setItem('chapterdatalist',JSON.stringify(data)) 
            console.log("ERROR: " + data[0].ERROR)
        }
        else{ 
            localStorage.setItem('chapterdatalist',JSON.stringify(data)) 
        }
        // get draft
        let url2 = "http://localhost:8080/author/getdraft/"
        url2 = url2 + storyid 
        const response_draft = await fetch(url2);
        const data_draft = await response_draft.json();

        if(Object.keys(data_draft[0]) == 'ERROR'){
            localStorage.setItem('data_draft',JSON.stringify(data_draft[0])) 
            alert("ERROR: " + data_draft[0].ERROR)
        }
        else{ 
            localStorage.setItem('data_draft',JSON.stringify(data_draft[0])) 
        }
        //get outline
        let url3 = "http://localhost:8080/author/getoutline/"
        url3 = url3 + storyid 
        const response_outline = await fetch(url3);
        const data_outline = await response_outline.json();

        if(Object.keys(data_outline[0]) == 'ERROR'){
            localStorage.setItem('data_outline',null) 
        }
        else{ 
            localStorage.setItem('data_outline',JSON.stringify(data_outline[0])) 
        }
        //await timeout(5000)
        // to detail page
        navigate('/story/detail')
        //reload to update page
        window.location.reload()
    }
  let image = require('../../../assets/' + avt)
  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={() => click_()}>
        {/* avt */}
        <div className=''>
            <img src={image} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-40 ml-5 w-[250px]'>
            {name}
        </div>

        <div className='mx-[20px] flex-col '>
            <div className='font-semibold my-[3px] text-[14px] w-[60px] text-center'>
                {process}
            </div>
            <div className='text-[12px] text-[#C5C7CD] w-[60px] text-center'>
                {approve}
            </div>
        </div>
        <div className='ml-[180px] flex-col'>
            <div className='font-bold my-[2px] text-[14px] text-[#cf3535]'>
                {unpaid} $
            </div>
            <div className='font-bold my-[2px] text-[14px] text-[#47e569]'>
                {paid} $
            </div>
        </div>
    </div>
  )
}

export default OverviewStory