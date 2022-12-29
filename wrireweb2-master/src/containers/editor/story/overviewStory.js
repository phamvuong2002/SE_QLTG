import React from 'react'
import { no_god } from '../../../assets'
import { useNavigate } from 'react-router-dom'

const OverviewStory = ({avt, name, process, approve, unpaid, paid}) => {

  const navigate = useNavigate()

  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={() => navigate('/story/detail')}>
        {/* avt */}
        <div className=''>
            <img src={avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-40 ml-5 w-[250px]'>
            {name}
        </div>

        <div className='mx-[20px] flex-col '>
            <div className='font-semibold my-[3px] text-[14px] w-[60px] text-center'>
                {process}
            </div>
            <div className='text-[12px] text-[#C5C7CD] w-[60px] text-center'>
                {approve}
            </div>
        </div>
        <div className='ml-[180px] flex-col'>
            <div className='font-bold my-[2px] text-[14px] text-[#cf3535]'>
                {unpaid} $
            </div>
            <div className='font-bold my-[2px] text-[14px] text-[#47e569]'>
                {paid} $
            </div>
        </div>
    </div>
  )
}

export default OverviewStory