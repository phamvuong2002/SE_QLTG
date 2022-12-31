import React from 'react'
import Create_Account from './account/createAcc'


const Overview = () => {
    return (
        <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>     
            <div className="grid grid-cols-4 gap-3 pb-5">
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Authors
                    </p>
                    <p className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        12
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Editor
                    </p>
                    <p className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        5
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Writting
                    </p>
                    <p className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        72
                    </p>
                </div>
                <div className="group bg-[#ffffff] w-[258px] h-[134px] rounded-lg shadow-md hover:bg-[#A7C7E7]">
                    <p className='group-hover:text-white text-center pt-6 text-[#9FA2B4]'>
                        Done
                    </p>
                    <p className='group-hover:text-white text-center font-bold text-5xl pt-2'>
                        38
                    </p>
                </div>
            </div>
            <div className='flex space-x-4 flex-nowrap w-fit h-fit bg-[#F7F8FC]'>     
                <div className="bg-[#ffffff] w-[529px] h-[336px] rounded-lg shadow-md">
                    <p className='text-[#252733] text-xl font-bold pt-6 pl-6'>
                        Story Management
                    </p>
                    <div className='flex pt-10 pl-6 pb-3'>
                        <p className='text-[#252733] '>
                            Approved chapters
                        </p>
                        <div className='pl-[300px]'>
                        <p className='absolute right-[800px] text-[#252733]'> 
                            4238
                        </p>
                        </div>
                    </div>
                    <hr></hr>
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] '>
                            Pending chapters
                        </p>
                        <p className='absolute right-[800px] text-[#252733]'> 
                            1005
                        </p>
                    </div>
                    <hr></hr>
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] '>
                            Paid amount
                        </p>
                        <p className='absolute right-[800px] text-[#252733]'> 
                            1.023.020$
                        </p>
                    </div>
                    <hr></hr>
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] '>
                            Unpaid amount
                        </p>
                        <p className='absolute right-[800px] text-[#252733]'> 
                            523.123$
                        </p>
                    </div>
                </div>
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
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] pr-[270px]'>
                            Delete account
                        </p>
                        <div className='bg-[#EC1D29] rounded-[100px]'>
                            <button className='mx-3 text-[#ffffff]' >
                                Delete
                            </button>
                        </div> 
                    </div>
                    <hr></hr>
                    <div className='flex pt-5 pl-6 pb-3'>
                        <p className='text-[#252733] pr-[330px]'>
                            See all
                        </p>
                        <div className='bg-[#9d9d9d] rounded-[100px]'>
                            <button className='mx-3 text-[#ffffff]' >
                                See all
                            </button>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Overview