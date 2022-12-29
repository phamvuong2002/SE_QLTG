import React, {Component} from 'react'
import SideBar from './SideBarAdmin'
const authorid = 'AU7947660'
//get data from local storage
const Header = (props) => {
  return (
    <div className='flex justify-between w-full'>
        <div> {props.name}</div>        
        <div>Lê Cung Tiến</div>

    </div>
  )
}

// class Header extends Component{
//   render(){
//     return
//   }
// }
export default Header