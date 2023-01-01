import { eren } from "../../../assets";
import {no_god } from "../../../assets";

let storydatalist = [];
const adminid = JSON.parse(localStorage.getItem('adminid'));

const GetStories = () => {
  const url = `http://localhost:8080/admin/stories/${adminid}`;
    fetch(url)
    .then((response) => response.json())
    .then(actualData => {
        // console.log(actualData.length);
        for(let i = 0; i < actualData.length; i++){
          storydatalist.push({"avt": actualData[i].AVATAR, "storyid": actualData[i].STORYID, "name": actualData[i].STORYNAME, "process": actualData[i].PROCESS, "approve": actualData[i].NUMOFCHAPS});
        }
    });
  console.log("story:", storydatalist);
};

GetStories();

export {storydatalist};

// export const storydatalist = [
//     {
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },
//     {
//         name:'Cừu chăn chú bé',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Bé sói cute',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },

// ]