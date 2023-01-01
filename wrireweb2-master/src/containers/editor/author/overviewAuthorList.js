import React from 'react'
import OverviewAuthor from './overviewAuthor'

const OverviewAuthorList = ({authorData}) => {
  // console.log('metnaa',authorData[0])
  return (
    
    <div className='py-1'>
         {authorData.map((data)  => (
          
        <OverviewAuthor 
        
        key={data.id} 
        avt={data.avt} 
        name={data.name} 
        // pen_name={data.pen_name}
        story={data.story}
        chapter={data.chapter}
        // paid_stt={data.paid_stt}
        />
        
      ))
      
    }
      
    </div>
  )
}

export default OverviewAuthorList