import React from 'react'
import { useNavigate } from 'react-router-dom'
const OverviewAuthor = ({avt, name, pen_name, chapter, story, paid_stt}) => {
const navigate = useNavigate()
  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={()=>navigate('/author/detail')}>
        {/* avt */}
        <div className=''>
            <img src={avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-[30px] ml-5'>
            {name}
        </div>

        <div className='font-semibold mr-[150px] ml-5'>
            {pen_name}
        </div>

        <div className='flex-col mr-[90px] items-center'>
            <div className='font-semibold text-[14px]'>
                {story} story
            </div>
            <div className='text-[12px]'>
                {chapter} chapter
            </div>
        </div>
        
        <div className='bg-[#F12B2C] rounded-3xl px-5 ml-40 items-center'>
            <button className='mx-3 text-[#ffffff]' >
                {paid_stt}
            </button>
        </div>
    </div>
  )
}

export default OverviewAuthor