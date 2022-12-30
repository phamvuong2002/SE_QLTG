import React from 'react'
import { Outlet } from 'react-router-dom'

import OverviewAuthor from './author/overviewAuthor'
import OverviewAuthorList from './author/overviewAuthorList'
import { authordatalist } from './author/authordatalist'

const Author = () => {
  return (
    <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>
      
      <div className='bg-[#ffffff] w-[1122px] h-fit shadow-2xl rounded-lg border border-[#DFE0EB] '>
        
        <div className='items-center px-5 my-[20px] bg-white font-bold'>
          All Author
        </div>

        {/* <div className='items-baseline my-[2px] text-[#9FA2B4] flex'>
          <div className='pl-[75px]'>
            Overview Author
          </div>
          <div className='pl-[315px]'>
            Type
          </div>
        </div> */}

        <div className=' items-center'>
          <OverviewAuthorList authorData={authordatalist}/>
        </div>

      </div>

    </div>
  )
}

export default Author