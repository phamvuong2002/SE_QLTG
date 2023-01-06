import { NavLink, Outlet, useNavigate } from 'react-router-dom'
import React from 'react'

import OverviewStoryList from './story/overviewStoryList'

import { storydatalist } from './story/storydatalist'



const Story = () => {

  const navigate = useNavigate()
  
  return (
        

<div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>
      
      <div className='bg-[#ffffff] w-[1122px] h-fit shadow-2xl rounded-lg border border-[#DFE0EB] '>
        
        <div className='items-center px-5 my-[20px] bg-white font-bold'>
          All Work
        </div>

        <div className='my-[2px] text-[#9FA2B4] flex'>
          <div className='ml-[75px] w-[250px]'>
            Overview Story
          </div>
          <div className='ml-[255px]'>
            Process
          </div>
          <div className='pl-[185px]'>
            Unpain/ Paid
          </div>
        </div>

        <div className=' items-center'>
          <OverviewStoryList storyData={storydatalist}/>
        </div>

      </div>

  </div>
    
  
  )
}

export default Story
