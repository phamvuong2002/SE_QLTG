import React from 'react'

import Content from './content'

const Read = () => {
  return (
  <div className='flex-col w-[800px] h-fit'>
    
    <div className='flex items-center'>

      <div className='mx-[200px] w-full'>
        <div className='text-[36px] text-center w-full bg-transparent'>
          Chapter 1
        </div>
        <div className='text-[16px] w-full text-center'>Chapter</div>
      </div>
      
      {/* <div className='bg-[#13A846] rounded-[100px] px-[14px] mx-[10px] w-[100px] h-[60px] '>
        <button className='text-[#ffffff] text-[15px]'   onClick={() => {}}>
                Add Comment
        </button>
      </div>  */}

    </div>


    <Content/>

    {/* <div className='flex place-content-center w-full h-fit mt-[10px] mx-[200px]'>
      <div className='bg-[#6731DC] rounded-[100px] px-[14px] py-[2px] mx-[10px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={() => {}}>
                Approve
        </button>
      </div>   
      <div className='bg-[#6731DC] rounded-[100px] px-[14px] py-[2px] mx-[10px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={() => {}}>
                Decline
        </button>
      </div>   
    </div> */}

  </div>
  )
}

export default Read