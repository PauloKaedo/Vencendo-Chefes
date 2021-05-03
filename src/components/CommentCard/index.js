import React from 'react' 

import { CommentDescription, CommentName } from '../../assets/styles'
import { Card, CardContent } from 'react-native-cards'

export default class CommentCard extends React.Component{

    constructor(props){
        super(props)
    }

    render = () => {
            return(
                
                <Card>
                    <CardContent>
                        <CommentName>{this.props.name}</CommentName>
                    </CardContent>  
                    <CardContent>
                        <CommentDescription>{this.props.comment}</CommentDescription>
                    </CardContent>
                </Card>
            )
    }
}