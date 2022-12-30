import React from 'react'


const Overview = () => {
    return (
    <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[20px]'>
    
    {/* Bảng trạng thái */}
    <div className='flex  w-[1122px] h-[134px] rounded-lg '>

        <button className='flex w-[258px] h-[134px] mr-[25px] ml-[10px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Story </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 60 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Chapter </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 12 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Earn </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 30 </div>
                    </div>
                </button>
            </div>   

        </button>
        
        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Receive </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 3 </div>
                    </div>
                </button>
            </div>   
        </button>
    </div>
    
    </div>
    )
}

export default Overview