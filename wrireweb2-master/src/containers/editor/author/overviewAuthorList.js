import React from 'react'
import OverviewAuthor from './overviewAuthor'

const OverviewAuthorList = ({authorData}) => {
  console.log('avtrr', authorData[0][1].AVATAR)
  return (
    
    <div className='py-1'>
         {authorData[0].map((data)  => (
          
        <OverviewAuthor 
        // key={data.id} 
        avt={data.AVATAR} 
        name={data.AUTHORNAME} 
        story={data.NUMOFSTORY}
        chapter={data.NUMOFCHAPS}
        // paid_stt={data.paid_stt}
        />
        
      ))
      
    }
      
    </div>
  )
}

export default OverviewAuthorList