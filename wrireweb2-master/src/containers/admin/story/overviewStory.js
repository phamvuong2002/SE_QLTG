import React from 'react';
// import { no_god } from '../../../assets'
import { useNavigate } from 'react-router-dom';

const OverviewStory = ({authorname, storyid, avt, name, process, numofchaps/*, unpaid, paid*/}) => {
    const navigate = useNavigate();  
    //   localStorage.removeItem('ad_storyid');
//   console.log("admin_storyid1:", JSON.parse(localStorage.getItem('admin_storyid')));
  const HandleClick = async () => {
    // console.log(storyid);
    let url_cal = `http://localhost:8080/admin/calPaidUnpaidStory/${storyid}`;
    var ad_story = {"authorname": authorname, "storyid": storyid, "avt": avt, "name": name, "process": process, "numofchaps": numofchaps};
    const response_cal = await fetch(url_cal);
    const data_cal = await response_cal.json();
    console.log("data_cal:", data_cal);
    ad_story.unpaid = data_cal[0].unpaid.toFixed(2);
    ad_story.paid = data_cal[0].paid.toFixed(2);
    localStorage.setItem('ad_story', JSON.stringify(ad_story));
    // localStorage.setItem('ad_story', JSON.stringify(null));
    console.log('ad_story:', JSON.parse(localStorage.getItem('ad_story')));
    navigate('/story/detail');
    window.location.reload();
  };

  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={HandleClick}>
        <div className=''>
            <img src={'/' + avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-40 ml-5 w-[250px]'>
            {name}
        </div>

        <div className='mx-[20px] flex-col '>
            <div className='font-semibold my-[3px] text-[14px] w-[60px] text-center'>
                {process}
            </div>
            <div className='text-[12px] text-[#C5C7CD] w-[60px] text-center'>
                {numofchaps}
            </div>
        </div>
        {/* <div className='ml-[180px] flex-col'>
            <div className='font-bold my-[2px] text-[14px] text-[#cf3535]'>
                {unpaid} $
            </div>
            <div className='font-bold my-[2px] text-[14px] text-[#47e569]'>
                {paid} $
            </div>
        </div> */}
    </div>
  )
}

export default OverviewStory