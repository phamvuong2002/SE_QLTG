import React from 'react'
import { no_god } from '../../../assets'
import { useNavigate } from 'react-router-dom'

const OverviewStory = ({storyid, avt, name, process, approve, unpaid, paid, authorname}) => {

    const navigate = useNavigate()
    async function click_(){
        localStorage.setItem('editor_storyid',storyid)
        localStorage.setItem('editor_avt',avt)
        localStorage.setItem('editor_name',name)
        localStorage.setItem('editor_unpaid',unpaid)
        localStorage.setItem('editor_paid',paid)
        localStorage.setItem('editor_approve',approve)
        localStorage.setItem('editor_authorname',authorname)
        // get chapters
        let url = "http://localhost:8080/editor/getallchapterofstory/"
        url = url + storyid 
        const response = await fetch(url);
        const data = await response.json();
       
        if(Object.keys(data[0]) === 'ERROR'){
            localStorage.setItem('editor_chapterdatalist',JSON.stringify(data)) 
            console.log("ERROR: " + data[0].ERROR)
        }
        else{ 
            localStorage.setItem('editor_chapterdatalist',JSON.stringify(data)) 
        }
        // await timeout(5000)
        // to detail page
        navigate('/story/detail')
        //reload to update page
        window.location.reload()
    }
    

    let avatar_story = require("../../../assets/" + avt)

    return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={() => click_()}>
        {/* avt */}
        <div className=''>
            <img src={avatar_story} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
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