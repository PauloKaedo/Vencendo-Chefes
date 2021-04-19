import React from 'react'

import { SliderBox } from 'react-native-image-slider-box'
import { TouchableOpacity } from 'react-native'

import CardView from 'react-native-cardview'
import Icon from  'react-native-vector-icons/AntDesign'

import {
    CommentTitle, BossName, BossDescription, BossDifficult, EasyCount, DifficultCount
} from '../../assets/styles'

import nemesis1 from '../../assets/imgs/nemesisSlide1.jpg'
import nemesis2 from '../../assets/imgs/nemesisSlide2.jpg'
import nemesis3 from '../../assets/imgs/nemesisSlide3.jpg'

import staticBoss from '../../assets/boss/boss.json'
import CommentCard from '../../components/CommentCard'
import { Text } from 'react-native-elements'

export default class BossShow extends React.Component{

    constructor(props){
        super(props)

        this.state = {
            navigator: this.props.navigation.state.params.navigator,
            bossId: this.props.navigation.state.params.bossId,
            boss: null
        }
    }

    loadBoss = () => {
        const { bossId } = this.state

        const bossFeeds = staticBoss.boss
        const selectedBoss = bossFeeds.filter((boss) => boss.id === bossId) 
        
        if(selectedBoss.length){
            this.setState({
                boss: selectedBoss[0]
            })
        }
    }

    componentDidMount = () => {
        this.loadBoss();
    }

    showSlides = () =>{
        const slides = [nemesis1, nemesis2, nemesis3]

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

    getComments = (comments) => {
        return (
            comments.map((comment) => {
            
                return (
                    <CommentCard name={comment.name} comment={comment.comment}></CommentCard>
                )
            })
        )
    }

    render = () =>{
        const { boss, navigator } = this.state

        if(boss){
            return(
                <>
                    <TouchableOpacity onPress = {() =>{
                        navigator.navigate("BossDetonated", {bossId: boss.id, navigator: navigator})
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
                    {this.getComments(boss.comments)}
                    
                </>
            )
        } else{
            return null
        }
    }
}