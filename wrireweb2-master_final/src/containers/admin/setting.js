import { Outlet } from 'react-router-dom'
import React from 'react'
import { useNavigate } from 'react-router-dom'


const Setting = () => {
  const navigate = useNavigate();
  function click_(){
    localStorage.clear();
    localStorage.setItem('role','login')
    navigate('/')
    window.location.reload();
  }
  return (
    <div className='px-[100px] items-end'>

      <div className='flex place-content-center w-full h-fit mt-[10px]'>
      <div className='bg-[#DB8E1A] rounded-[100px] px-[14px] py-[2px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={() => click_()}>
                Logout
        </button>
      </div>   
    </div>
    </div>
  )
}

export default Setting
