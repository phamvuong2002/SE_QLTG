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
    const response_cal = await fetch(url_cal);
    const data_cal = await response_cal.json();
    // console.log("data_cal:", data_cal);
    var unpaid = data_cal[0].unpaid.toFixed(2);
    var paid = data_cal[0].paid.toFixed(2);
    localStorage.setItem('storyid',storyid);
    localStorage.setItem('authorname',authorname);
    localStorage.setItem('avt',avt);
    localStorage.setItem('name_content',name);
    localStorage.setItem('unpaid',unpaid);
    localStorage.setItem('paid',paid);
    localStorage.setItem('numofchaps',numofchaps);

    // get chapters
    let url = "http://localhost:8080/author/getallchapterofstory/"
    url = url + storyid 
    const response = await fetch(url);
    const data = await response.json();
    
    if(Object.keys(data[0]) == 'ERROR'){
        localStorage.setItem('chapterdatalist',JSON.stringify(data)) 
        alert("ERROR: " + data[0].ERROR)
    }
    else{ 
        localStorage.setItem('chapterdatalist',JSON.stringify(data)) 
    }
    // get draft
    let url2 = "http://localhost:8080/author/getdraft/"
    url2 = url2 + storyid 
    const response_draft = await fetch(url2);
    const data_draft = await response_draft.json();

    if(Object.keys(data_draft[0]) == 'ERROR'){
        localStorage.setItem('data_draft',JSON.stringify(data_draft[0])) 
        alert("ERROR: " + data_draft[0].ERROR)
    }
    else{ 
        localStorage.setItem('data_draft',JSON.stringify(data_draft[0])) 
    }
    //get outline
    let url3 = "http://localhost:8080/author/getoutline/"
    url3 = url3 + storyid 
    const response_outline = await fetch(url3);
    const data_outline = await response_outline.json();

    if(Object.keys(data_outline[0]) == 'ERROR'){
        localStorage.setItem('data_outline',null) 
        alert("ERROR: " + data_outline[0].ERROR)
    }
    else{ 
        localStorage.setItem('data_outline',JSON.stringify(data_outline[0])) 
    }
    //await timeout(5000)
    // to detail page
    navigate('/story/detail')
    //reload to update page
    window.location.reload()
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