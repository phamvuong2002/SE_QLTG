import React from 'react'
import { useNavigate } from 'react-router-dom'
const OverviewEditor = ({avt, name, pen_name, chapter, story}) => {
const navigate = useNavigate()
  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={()=>navigate('/editor/detail')}>
        {/* avt */}
        <div className=''>
            <img src={avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-[30px] ml-5'>
            {name}
        </div>

        <div className='font-semibold mr-[100px] ml-[250px]'>
            {pen_name}
        </div>

        <div className='flex-col mr-[20px] ml-[150px] items-center'>
            <div className='font-semibold text-[14px]'>
                {story} story
            </div>
            <div className='text-[12px]'>
                {chapter} chapter
            </div>
        </div>
    </div>
  )
}

export default OverviewEditor