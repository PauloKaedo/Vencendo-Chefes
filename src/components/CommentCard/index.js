import React from 'react' 

import avatar from '../../assets/imgs/avatar-comment.png' 
import { CommentDescription, CommentName } from '../../assets/styles'
import { Card, CardContent, CardImage } from 'react-native-cards'

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