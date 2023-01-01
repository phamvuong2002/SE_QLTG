import React from 'react'

let url = "http://localhost:8080/editor/countstory/"


const editorid = 'ED841430' // get from login page
localStorage.setItem('editorid', editorid)

let dataeditor = {
    "numstory": "",
    "numchap": "",
    "earn": "",
    "receive": ""
}

async function connectfetch(){
    url = url + editorid 
    const response = await fetch(url);
    const data = await response.json();
    
    if(Object.keys(data[0]) === 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
    }
    else{
        dataeditor.numstory = data[0].numstory;
        dataeditor.numchap = data[0].numchap;
        dataeditor.earn = data[0].earn.toFixed(2);
        dataeditor.receive = data[0].receive.toFixed(2);
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
                        <div id = "numstory" className='text-[#252733] text-[60px] font-semibold'> {dataeditor.numstory} </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Chapter </div>
                        <div id = "numchapter" className='text-[#252733] text-[60px] font-semibold'> {dataeditor.numchap} </div>
                    </div>
                </button>
            </div>   
        </button>

        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Earn </div>
                        <div id = "earn" className='text-[#252733] text-[60px] font-semibold'> {dataeditor.earn} </div>
                    </div>
                </button>
            </div>   

        </button>
        
        <button className='flex w-[258px] h-[134px] mx-[25px]  border-[#c4c7ea]'>
            <div className='bg-[#ffffff] rounded-[8px] px-[14px] py-[2px]  border-[2px]'>
                <button className=' w-[258px] h-[134px]' >
                    <div className='flex-col'>
                        <div className='text-[#9FA2B4] text-[19px] font-semibold mt-[10px]'> Receive </div>
                        <div id = "receive" className='text-[#252733] text-[60px] font-semibold'> {dataeditor.receive} </div>
                    </div>
                </button>
            </div>   
        </button>
    </div>
    
    </div>
    )
}

export default Overview