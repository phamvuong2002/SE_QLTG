import React from 'react'
const OverviewAcc = ({avt, name, type}) => {
  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2'>
        {/* avt */}
        <div className=''>
            <img src={avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-40 ml-5'>
            {name}
        </div>

        <div className='font-semibold mx-40'>
            {type}
        </div>
        <div className='bg-[#F12B2C] rounded-3xl px-5 ml-40 items-center'>
            <button className='mx-3 text-[#ffffff]' >
                Delete
            </button>
        </div>
    </div>
  )
}

export default OverviewAcc