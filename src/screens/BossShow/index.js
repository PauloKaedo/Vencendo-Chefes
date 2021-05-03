import React from 'react'

import { SliderBox } from 'react-native-image-slider-box'
import { TouchableOpacity } from 'react-native'

import CardView from 'react-native-cardview'
import Icon from  'react-native-vector-icons/AntDesign'

import {
    CommentTitle, BossName, BossDescription, BossDifficult, EasyCount, DifficultCount
} from '../../assets/styles'

import CommentCard from '../../components/CommentCard'

import { getBossById, getCommentById, getImage } from '../../api'

export default class BossShow extends React.Component{

    constructor(props){
        super(props)

        this.state = {
            navigator: this.props.navigation.state.params.navigator,
            bossId: this.props.navigation.state.params.bossId,
            boss: null,
            slides: [],
            comments: []
        }
    }

    loadBoss = () => {
        const { bossId } = this.state

        getBossById(bossId).then(selectedBoss => {
            if(selectedBoss.length){
                const {image_1, image_2, image_3} = selectedBoss[0].enemy
                this.setState({
                    boss: selectedBoss[0],
                    slides: [getImage(image_1), getImage(image_2), getImage(image_3)]
                })
            }
            this.getComments();
        }).catch (err => {
            console.log(err)
        })

    }

    componentDidMount = () => {
        this.loadBoss()
    }

    showSlides = () =>{
        const slides = this.state.slides
        return(
            <SliderBox
                dotColor={'#667292'}
                inactiveDotColor={'#bccad6'}

                resizeMethod={'resize'}
                resizeMode={"cover"}

                dotStyle={{
                    width: 15,
                    height: 15,

                    borderRadius: 15,
                    marginHorizontal: 5
                }}

                images={slides}
            >

            </SliderBox>
        )
    }

    getComments = () => {
        const { bossId } = this.state

         getCommentById(bossId).then(comments => {
            this.setState({comments: [...this.state.comments, ...comments]})            
        }).catch (err => {
            console.log(err)
        })
    }

    renderComments() {
        return this.state.comments.map(comment => <CommentCard name={comment.name} comment={comment.comment} key={comment._id}></CommentCard>)        
    }

    render = () =>{
        const { boss, navigator } = this.state

        if(boss){
            return(
                <>
                    <TouchableOpacity onPress = {() =>{
                        navigator.navigate("BossDetonated", {bossId: boss._id, navigator: navigator})
                    }}>
                        <CardView
                            cardElevaton={2}
                            cornerRadius={0}
                        >
                            {this.showSlides()}
                            <BossName>{boss.enemy.name}</BossName>
                            <BossDifficult>{boss.enemy.difficulty}</BossDifficult>
                            <BossDescription>{boss.enemy.description}</BossDescription>
                            <Icon name="heart" size={18}>
                                <EasyCount> {boss.easy}</EasyCount>
                            </Icon>
                            <Icon name="heart" size={18}>
                                <DifficultCount> {boss.hard}</DifficultCount>
                            </Icon>
                        </CardView>
                    </TouchableOpacity>
                    <CommentTitle>Comentários dos Especialistas</CommentTitle>
                    {this.renderComments()}
                    
                </>
            )
        } else{
            return null
        }
    }
}