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
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Authors </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 60 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Editors </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 12 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Writting </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 30 </div>
                    </div>
                </button>
            </div>   

        </button>
        
        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Done </div>
                        <div className='text-[#252733] text-[60px] font-semibold'> 3 </div>
                    </div>
                </button>
            </div>   
        </button>
    </div>

    <div className='bg-[#111111] w-[1220px] h-[336px] ml-[10px] mt-[50px] relative'>
        <div className='bg-[#ffffff] w-[546px] h-[336px] rounded-lg absolute left-0 flex'>
        
            <div className='text-[20px] absolute left-2 top-2 font-bold text-[#252733]'>Story Manager</div>
            <div></div>

        </div>

        <div className='bg-[#ffffff] w-[546px] h-[336px] rounded-lg absolute right-0'>
            
        </div>
    </div>
    
    </div>
    )
}

export default Overview