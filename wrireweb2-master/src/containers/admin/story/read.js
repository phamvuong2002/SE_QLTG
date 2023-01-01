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
    </div>


    <Content/>

  </div>
  )
}

export default Read