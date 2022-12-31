import React from 'react'
import { logo } from '../../../assets'

const Create_Account = () => {
    return (
        <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[355px]'>
            <div className="items-baseline w-[443px] h-[500px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#DFE0EB]">
                <img src={logo} alt='logo' className='px-24 py-10'/>
                <div className='text-xl text-center font-bold pt-2'>
                    Create Account
                </div>
                <form className='pt-7'>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">USERNAME</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input placeholder='Enter username' className="pl-2 bg-[#F7F8FC] text-[15px] block w-[400px] rounded-md border border-[#DFE0EB]"/>
                        </div>
                    </label>
                </form>
                <form className='pt-3'>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">PASSWORD</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input placeholder='Enter password' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]"/>
                        </div>
                    </label>
                </form>
                <div className='flex place-content-center w-full mt-[20px]'>
                    <div className='bg-[#DB8E1A] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                        <button className='mx-3 text-[#ffffff] pb-2' >
                            Create For Author
                        </button>
                    </div>
                </div>
                <div className='flex place-content-center w-full mt-[5px]'>
                    <div className='bg-[#3751FF] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                        <button className='mx-3 text-[#ffffff] pb-2' >
                            Create For Editor
                        </button>
                    </div>
                </div>
                <div className='flex place-content-center w-full mt-[5px]'>
                    <div className='bg-[#E94242] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                        <button className='mx-3 text-[#ffffff] pb-2' >
                            Create For Admin
                        </button>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Create_Account