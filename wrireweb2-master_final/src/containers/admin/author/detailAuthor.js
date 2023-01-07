import React from 'react';
import { useNavigate } from 'react-router-dom';
// import { eren } from '../../../assets';
// const ad_author = JSON.parse(localStorage.getItem('ad_author') || '[]');
// import avt from '../../../assets/avatar_vio_18.jpg';

const AllAuthorWork = ({storyid, avt, name, process, unpaid, paid, numofchaps}) => {
    const navigate = useNavigate();
    const ad_author = JSON.parse(localStorage.getItem('ad_author') || '[]');
    const HandleClick = async() => {
        var ad_story = {"storyid": storyid, "name": name, "avt": avt, "paid": paid, "unpaid": unpaid, "authorname": ad_author, "numofchaps": numofchaps};
        console.log(ad_story);
        localStorage.setItem('ad_story', JSON.stringify(ad_story));

        let url_cal = `http://localhost:8080/admin/calPaidUnpaidStory/${storyid}`;
        const response_cal = await fetch(url_cal);
        const data_cal = await response_cal.json();
        // console.log("data_cal:", data_cal);
        var unpaid = data_cal[0].unpaid.toFixed(2);
        var paid = data_cal[0].paid.toFixed(2);
        localStorage.setItem('storyid',storyid);
        localStorage.setItem('authorname',ad_author.name);
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
    return(
        <div className='flex' onClick={HandleClick}>
            <div className='text-[#9FA2B4] ml-[20px] mt-[10px] font-bold text-sm w-[50px] h-[50px]'>
                <img src={'/' + avt} alt='Hinh'></img>
            </div>
            <div className='text-[#252733] ml-[8px] mt-[13px] font-bold text-sm'>
                <p className=''>{name}</p>
                {/* <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>Update 1 day ago</p>
                </div> */}
            </div>
            <div className='mt-[10px] ml-[148px] font-bold text-sm text-[#252733]'>
                <p>Chapters</p>
                <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>Chap {numofchaps}</p>
                </div>
            </div>
            {/* <div className='mt-[10px] ml-[100px] font-bold text-sm text-[#252733]'>
                <p>50$</p>
                <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>Total: 550$</p>
                </div>
            </div> */}
            <div className='mt-[8px] ml-[170px] font-bold text-sm text-[#C61C1C]'>
                <p>{unpaid}$</p>
                <div className='text-[#35C655] text-sm font-bold'>
                    <p className=''>{paid}$</p>
                </div>
            </div>
            <div className='mt-[13px] ml-[130px] font-bold text-sm text-[#C61C1C]'>
                <div className='w-[102px] h-[24px] bg-[#A5A6F6] text-center pt-0.5 text-[#ffffff] rounded-full'>
                    <p>{process}</p>
                </div>
            </div>
        </div>
    )
};

const OverviewAuthorStoryList = ({authorstorylist}) => {
    return (
      <div className='py-1'>
        {authorstorylist.map((data) => (
            <AllAuthorWork
            storyid={data.storyid}
            avt={data.avt}
            name={data.name}
            process={data.process}
            unpaid={data.unpaid}
            paid={data.paid}
            numofchaps={data.numofchaps} 
            />
        ))}
      </div>
    )
}

const Detail_Author_ad = () => {
    const ad_author = JSON.parse(localStorage.getItem('ad_author') || '[]');
    console.log("ad_author1:", ad_author.authorid);
    let authorstorylist = JSON.parse(localStorage.getItem('authorstorylist') || '[]');
    var unpaid = 0;
    var paid = 0;
    for(let i = 0; i < authorstorylist.length; i++){
        unpaid += parseFloat(authorstorylist[i].unpaid);
        paid += parseFloat(authorstorylist[i].paid);
    }
    console.log(unpaid, paid);
    console.log('authorstorylist2:', authorstorylist);
    return (
        <div className='flex-col shadow-2xl w-[1020px] h-[537px] border rounded-lg bg-[#F7F8FC] ml-[70px]'>   
            <div className='flex pl-10 pt-5'>
                <img src={'/' + ad_author.avt} alt='avt' className='rounded-full w-[150px] h-[150px] '/>
                <div className='pl-10 pt-12 pr-[120px]'>
                    <p className='text-[40px]'>
                        {ad_author.name}
                    </p>
                </div>
                <div className='flex' >
                    <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#BFB17C]'>
                        <p className='text-center pt-5 text-[#D0AB4C] text-[20px]'>
                            Unpaid
                        </p>
                        <p className='text-center pt-3 text-4xl text-bold text-[#D0AB4C]'>
                            {unpaid}$
                        </p>
                    </div>
                    <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#3751FF] ml-[40px]' >
                        <p className='text-center pt-5 text-[#3751FF] text-[20px]'>
                            Paid
                        </p>
                        <p className='text-center pt-3 text-4xl text-bold text-[#3751FF]'>
                            {paid}$
                        </p>
                    </div>
                </div>
            </div>
            {/* <div className='bg-[#F12B2C] shadow-2xl rounded-full w-[70px] h-[20px] mb-3 text-sm text-center ml-[900px]'>
                <a href=''>
                    <button className='text-[#ffffff]' >
                        Delete
                    </button>
                </a>
            </div> */}
            <div className='shadow-2xl border-t-[#DFE0EB]-500 w-[1020px] h-[347px] border rounded-lg bg-[#F7F8FC]'>
                <div className='text-[#252733] text-xl font-bold ml-[20px] mt-[20px]'>
                    <h1>All Work</h1>
                </div>
                <div>
                    <div className='flex pb-3'>
                        <div className='text-[#9FA2B4] ml-[20px] mt-[20px] font-bold text-sm'>
                            <p>Story</p>
                        </div>
                        <div className='text-[#9FA2B4] ml-[280px] mt-[20px] font-bold text-sm'>
                            <p>Progress</p>
                        </div>
                        {/* <div className='text-[#9FA2B4] ml-[100px] mt-[20px] font-bold text-sm'>
                            <p>Pay For Each Work</p>
                        </div> */}
                        <div className='text-[#9FA2B4] ml-[100px] mt-[20px] font-bold text-sm'>
                            <p>Paid Status</p>
                        </div>
                        <div className='text-[#9FA2B4] ml-[100px] mt-[20px] font-bold text-sm'>
                            <p>Story Status</p>
                        </div>
                    </div>
                    <hr></hr>
                    
                    <div className=' items-center'>
                        <OverviewAuthorStoryList authorstorylist={authorstorylist}/>
                    </div>
                    
                </div>
            </div>
        </div>
    )
}

export default Detail_Author_ad