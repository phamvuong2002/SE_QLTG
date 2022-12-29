import React from 'react'
import logo from '../assets/logo.png'
import { sidebaradminMenu } from '../ultis/menu'
import { NavLink } from 'react-router-dom'

const notActiveStlye = 'py-2 px-[50px] font-bold flex gap-2 items-center text-[#A4A6B3] text-[16px]'
const activeStlye = 'py-2 px-[50px] font-bold flex gap-2 items-center text-[#DDE2FF] text-[20px]'

const SideBarAdmin = () => {
  return (
    <div className='flex flex-col bg-[#363740] h-full'>
      <div className='w-full h-[70px] py-[5px] px-[5px]' >
        <img src={logo} alt='logo' 
          className='w-[200px] object-contain'/>
      </div>
      <div className='flex flex-col'>
        {sidebaradminMenu.map(item => (
            <NavLink to={item.path}
            className = {({isActive}) =>  isActive? activeStlye:notActiveStlye }
            key = {item.path}
            end = {item.end}
            >
              {item.icons}
              <span>{item.text}</span>
            </NavLink>
        ))}
      </div>
    </div>
  )
}

export default SideBarAdmin