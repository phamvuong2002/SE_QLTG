import React from 'react'
import { useNavigate } from 'react-router-dom'

const paid = 'bg-[#29CC97] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]';
const not_paid = 'bg-[#F12B2C] rounded-[20px] px-[24px] py-[2px] mx-3 text-[#ffffff]'


let OverviewChapter = ({ id, content, name, paid_stt, stt }) => {

  const navigate = useNavigate()
  function click_() {
    localStorage.setItem('TYPE', 'DETAILCHAPTER')
    localStorage.setItem('chapter_name', name)
    localStorage.setItem('chapter_content', content)
    localStorage.setItem('chapter_id', id)
    navigate('/story/write')
    window.location.reload()
  }
  return (
    <div className='flex h-[60px] border-t items-center' onClick={() => click_()}>
      <div className='text-[14px] font-semibold mx-[40px] w-[100px]'> {name} </div>
      <div className='flex place-content-center w-full h-fit mx-[50px]'>
        <div className={(paid_stt === 'Paid') ? paid : not_paid}>
          {paid_stt}
        </div>
      </div>
      <div className='text-[14px] font-semibold mx-[50px]'>{stt} </div>
    </div>
  )
}

export default OverviewChapter