import { Outlet } from 'react-router-dom'
import React from 'react'
import { useNavigate } from 'react-router-dom'
import OverviewEditorList from './editor/overviewEditorList'
import { editordatalist } from './editor/editordatalist'

const Editor = () => {
  return (
    <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>
      <div className='bg-[#ffffff] w-[1122px] h-fit shadow-2xl rounded-lg border border-[#DFE0EB] '>
        <div className='items-center px-5 my-[20px] bg-white font-bold'>
          All Editor
        </div>
        <div className=' items-center'>
          <OverviewEditorList authorData={editordatalist}/>
        </div>
      </div>
   </div>
  )
}

export default Editor