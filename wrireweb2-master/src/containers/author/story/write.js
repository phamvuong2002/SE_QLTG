import React from 'react'

import Content from './content'

const Write = () => {
  async function click_(){
    const name_darft = document.getElementById('name_darft').value
    alert(localStorage.getItem('TYPE') + ' name_darft :' + name_darft + ' content: '+ localStorage.getItem('content') )
    localStorage.removeItem('content')
    // localStorage.setItem('TYPE','STORY' )
}
  return (
  <div className='flex-col w-fit h-fit'>
    
    <div className='mx-[200px] w-full items-center'>
      <input className='text-[36px] text-center w-full bg-transparent' placeholder='<Name>' id = "name_darft">
      </input>
      <div className='text-[16px] w-full text-center'>Draft</div>
    </div>
    
    <Content/>

    <div className='flex place-content-center w-full h-fit mt-[10px] mx-[200px]'>
      <div className='bg-[#B79F22] rounded-[100px] px-[14px] py-[2px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={() => click_()}>
                Done
        </button>
      </div>   
    </div>

  </div>
  )
}

export default Write