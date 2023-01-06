import React from 'react'
import { logo } from '../../../assets'


const Create_Account = () => {
    function getData(form) {
        var formData = new FormData(form);
        const values = Object.fromEntries(formData)
        return values
    }
    async function createAccount(url_create) {
        const form = document.getElementById("createform")
        form.addEventListener("submit", async (e) => {
            e.preventDefault();
            const jsonObject = getData(e.target);
            alert(JSON.stringify(jsonObject)  + ' ' + url_create)
        });
        window.location.reload();
    }
    function createAuthor(){
        let url = 'link author'
        createAccount(url)

    }
    function createEditor(){
        let url = 'link editor'
        createAccount(url)
    }
    function createAdmin(){
        ;let url = 'link admin'
        createAccount(url)
    }
    
    return (
        <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[355px]'>
            <div className="items-baseline w-[443px] h-[700px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#DFE0EB]">
                <img src={logo} alt='logo' className='px-24 py-10' />
                <div className='text-xl text-center font-bold pt-2'>
                    Create Account
                </div>
                <form className='pt-7' id = 'createform'>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">USERNAME</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='username' placeholder='Enter username' className="pl-2 bg-[#F7F8FC] text-[15px] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">PASSWORD</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='password' placeholder='Enter password' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">ADMIN NAME</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='adminname' placeholder='Enter Admin Name' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" require />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">PHONE NUMBER</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='phonenumber' placeholder='Enter Phone Number' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">EMAIL</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='email' placeholder='Enter Email' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <div className='flex place-content-center w-full mt-[20px]'>
                        <div className='bg-[#DB8E1A] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                            <button className='mx-3 text-[#ffffff] pb-2' onClick={() => createAuthor()}>
                                Create For Author
                            </button>
                        </div>
                    </div>
                    <div className='flex place-content-center w-full mt-[5px]'>
                        <div className='bg-[#3751FF] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                            <button className='mx-3 text-[#ffffff] pb-2' onClick={() => createEditor()}>
                                Create For Editor
                            </button>
                        </div>
                    </div>
                    <div className='flex place-content-center w-full mt-[5px]'>
                        <div className='bg-[#E94242] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                            <button className='mx-3 text-[#ffffff] pb-2' onClick={() => createAdmin()}>
                                Create For Admin
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default Create_Account