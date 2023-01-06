import OverviewAccList from './account/overviewAccList'
import { accdatalist } from './account/accdatalist'

const Account = () => {
  return (
    <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[70px]'>     
      <div className='bg-[#ffffff] w-[1122px] h-fit shadow-2xl rounded-lg border border-[#DFE0EB] '>
        <div className='items-center px-5 my-[20px] bg-white font-bold'>
          All Account
        </div>

        <div className='items-baseline my-[2px] text-[#9FA2B4] flex'>
          <div className='pl-[75px]'>
            Overview Account
          </div>
          <div className='pl-[315px]'>
            Type
          </div>
        </div>

        <div className=' items-center'>
          <OverviewAccList accData={accdatalist}/>
        </div>

      </div>
      

      <div className='flex place-content-center w-full h-fit mt-[20px]'>
        <div className='bg-[#7879F1] rounded-[100px] px-[14px] py-[2px]'>
          <a href='/account/create'>
            <button className='mx-3 text-[#ffffff]' >
                Create
            </button>
           </a>
          </div>   
      </div>

    </div>
  )
}

export default Account