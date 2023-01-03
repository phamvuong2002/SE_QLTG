import React, { useState, useEffect } from 'react';
import Create_Account from './account/createAcc';
import { useNavigate } from 'react-router-dom';
import Account from './account';
const adminid = 'AD342720'; //update later
const PersonName  = "Web lol"; // get from login page
//const authorid = "AU7947660"
localStorage.setItem('PersonName', PersonName);
localStorage.setItem('adminid', JSON.stringify(adminid));

const Overview = () => {
    const url = `http://localhost:8080/admin/ADoverview/${adminid}`;
    const [data, setData] = useState({SLTG: '', SLBT: '', ONPROGRESS: '', DONE: ''});
    useEffect(() => {
        fetch(url)
        .then((response) => response.json())
        .then(actualData => {
            // console.log(actualData[0]);
            setData({
                SLTG: actualData[0].SLTG,
                SLBT: actualData[0].SLBT,
                ONPROGRESS: actualData[0].ONPROGRESS,
                DONE: actualData[0].DONE,
            });
        });
    }, []);
    const navigate = useNavigate();
    // console.log(data);
    return (
        <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>     
            <div className="grid grid-cols-4 gap-3 pb-5">
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Authors
                    </p>
                    <p id='authors' className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        {data.SLTG}
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Editor
                    </p>
                    <p id='editors' className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        {data.SLBT}
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Writting
                    </p>
                    <p id='writing' className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        {data.ONPROGRESS}
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Done
                    </p>
                    <p id='done' className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        {data.DONE}
                    </p>
                </div>
            </div>
            <div className='flex space-x-4 flex-nowrap w-fit h-fit bg-[#F7F8FC]'>     
                <div className="bg-[#ffffff] w-[529px] h-[336px] rounded-lg shadow-md">
                    <p className='text-[#252733] text-xl font-bold pt-6 pl-6'>
                        Account Management
                    </p>
                    <div className='flex pt-10 pl-6 pb-3'>
                        <p className='text-[#252733] pr-[270px]'>
                            Create account
                        </p>
                        <div className='bg-[#29CC97] rounded-[100px]'>
                            <a href='/account/create'>
                                <button className='mx-3 text-[#ffffff]' >
                                    Create
                                </button>
                            </a>
                        </div>   
                    </div>
                    <hr></hr>
                    <hr></hr>
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] pr-[330px]'>
                            See all
                        </p>
                        <div className='bg-[#9d9d9d] rounded-[100px]'>
                            <a href="/account">   
                                <button className='mx-3 text-[#ffffff]'>
                                    See all
                                </button>
                            </a>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Overview