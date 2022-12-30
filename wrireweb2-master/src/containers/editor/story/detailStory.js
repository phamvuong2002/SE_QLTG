import React from 'react'
import { eren } from '../../../assets'
import OverviewChapter  from './overviewChapter'
import OverviewChapterList from './overviewChapterList' 
import OverviewDraft_Outline from './overviewDraft_Outline'

import { chapterdatalist } from './chapterdatalist'

import { useNavigate } from 'react-router-dom'

import Write from './read'

const DetailStory_ed = () => {

  const navigate = useNavigate()

  return (
    <div className='bg-[#ffffff] w-[1122px] h-[657px] shadow-2xl rounded-lg border border-[#DFE0EB] ml-[70px]'>
        <div className='flex h-[180px]'>

            <img src={eren} alt='Avt' className=' w-[120px] h-[120px] rounded-full my-[15px] mx-[15px]' />

            <div className='flex-col'>
                <div className='text-[36px] font-semibold'>
                    Chú bé chăn cừu
                </div>
                <div className='flex'>
                    <div className='text-[20px] text-[#C5C7CD]'>Author:</div>
                    <div className='text-[20px] font-bold mx-[15px]'>You</div>
                </div>
            </div>

            <div className='flex-col'>

                <div className='flex my-[10px] mx-[30px]'>
                    <button className='flex w-[152px] h-[90px] mx-[28px]  border-[#c4c7ea]'>
                        <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                            <button className=' w-[152px] h-[90px]' >
                                <div className='flex-col'>
                                    <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Paid </div>
                                    <div className='text-[#252733] text-[24px] font-semibold'> 60 </div>
                                </div>
                            </button>
                        </div>   
                    </button>

                    <button className='flex w-[152px] h-[90px] mx-[28px]  border-[#c4c7ea]'>
                        <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                            <button className=' w-[152px] h-[90px]' >
                                <div className='flex-col'>
                                    <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Unpaid </div>
                                    <div className='text-[#252733] text-[24px] font-semibold'> 60 </div>
                                </div>
                            </button>
                        </div>   
                    </button>

                    <button className='flex w-[152px] h-[90px] mx-[28px]  border-[#c4c7ea]'>
                        <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                            <button className=' w-[152px] h-[90px]' >
                                <div className='flex-col'>
                                    <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Chapters </div>
                                    <div className='text-[#252733] text-[24px] font-semibold'> 60 </div>
                                </div>
                            </button>
                        </div>   
                    </button>
                </div>

            </div>

        </div>
            

        <div className='flex-col'>
            <div className='items-center px-5 my-[20px] bg-white font-bold border-t'>
                Story
            </div>
            <OverviewDraft_Outline name={'Draft'} paid_stt='Paid' stt='Checked'/>
            <OverviewDraft_Outline name={'Outline'} paid_stt='Paid' stt='Checked'/>
            <div className='items-center px-5 h-[60px] bg-white border-t py-[10px] font-semibold'>
                Chapters : {}
            </div>
            <OverviewChapterList chapterData={chapterdatalist}/>
        </div>
        

    </div>
  )
}

export default DetailStory_ed