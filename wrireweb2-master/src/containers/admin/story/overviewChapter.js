import React from 'react'
import { useNavigate } from 'react-router-dom'

const paid = 'bg-[#29CC97] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]';
const not_paid = 'bg-[#F12B2C] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]'


const OverviewChapter = ({name, paid_stt, stt}) => {

  const navigate = useNavigate()

  return (
    <div className='flex h-[60px] border-t items-center' onClick={() => navigate('/story/read')}>
      <div className='text-[14px] font-semibold mx-[40px] w-[100px]'> {name} </div>
      <div className='flex place-content-center w-full h-fit mx-[50px]'>
          <div className= { (paid_stt === 'Paid')? paid:not_paid }>
              {paid_stt}
            </div>   
        </div>
      <div className='text-[14px] font-semibold mx-[50px]'>{stt} </div>

    </div>
  )
}

export default OverviewChapter