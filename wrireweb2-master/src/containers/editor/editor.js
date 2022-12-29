import React from 'react'
import { Outlet } from 'react-router-dom'

import { SideBarEditor } from '../../components'
import { Header } from '../../components'
import path from '../../ultis/path'

const Editor = () => {
  return (
    <div className="w-full min-h-screen flex h-full bg-[#F7F8FC]">
           <div  className='w-[255px] min-h-screen border border-blue-500'>
                <SideBarEditor></SideBarEditor>
           </div>
           <div className='flex-col w-full'>
                <div className='h-[70px] px-[59px] flex items-center'>
                    <Header name = {''} />
                </div>
                <Outlet/>
           </div>
        </div>
  )
}

export default Editor