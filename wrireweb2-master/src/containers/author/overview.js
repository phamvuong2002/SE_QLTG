import React from 'react'
const authorid = 'AU7947660'
let url = "http://localhost:8080/author/countStory/"

async function connectfetch(){
    url = url + authorid 
    const response = await fetch(url);
    const data = await response.json();
    
    if(Object.keys(data[0]) == 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
    }
    else{
        document.getElementById("numstory").innerText = data[0].numstory   
        document.getElementById("numchapter").innerText = data[0].numchap   
        document.getElementById("earn").innerText = data[0].earn.toFixed(2)   
        document.getElementById("receive").innerText = data[0].receive.toFixed(2)  
        console.log("data overview", data[0])
    }
}

connectfetch()

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
                        <div className='text-[#252733] text-[60px] font-semibold' id = "numstory"> 20 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Chapter </div>
                        <div className='text-[#252733] text-[60px] font-semibold' id = "numchapter"> 12 </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Earn </div>
                        <div className='text-[#252733] text-[60px] font-semibold'id = "earn"> 30 </div>
                    </div>
                </button>
            </div>   

        </button>
        
        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Receive </div>
                        <div className='text-[#252733] text-[60px] font-semibold' id = "receive"> 3 </div>
                    </div>
                </button>
            </div>   
        </button>
    </div>
    
    </div>
    )
}

export default Overview