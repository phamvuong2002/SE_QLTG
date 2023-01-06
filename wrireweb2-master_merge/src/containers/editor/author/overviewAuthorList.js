import React from 'react'
import OverviewAuthor from './overviewAuthor'

const OverviewAuthorList = ({authorData}) => {
  
  return (
    
    <div className='py-1'>
         {authorData.map((data)  => (
          
          <OverviewAuthor 
          
          authorid={data.authorid} 
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