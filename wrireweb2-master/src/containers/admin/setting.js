import { Outlet } from 'react-router-dom'
import React from 'react'


const Setting = () => {
  return (
    <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>     
      <div className='flex place-content-center w-full h-fit mt-[20px]'>
        <div className='bg-[#DB8E1A] self-center rounded-full border-2 border-black-600 py-[5px]'>
              <button className='mx-3 w-[61.5rem] text-[#ffffff]' >
                  Log Out
              </button>
          </div>   
      </div>
    </div>
  )
}

export default Setting
