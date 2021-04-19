import React from 'react'

import { SliderBox } from 'react-native-image-slider-box'

import CardView from 'react-native-cardview'

import {
    BossNameDetonated, BossDetonatedDescription
} from '../../assets/styles'

import nemesis1 from '../../assets/imgs/nemesisSlide1.jpg'

import staticBoss from '../../assets/boss/boss.json'
import { Card, CardContent } from 'react-native-cards'


export default class BossShow extends React.Component{

    constructor(props){
        super(props)

        this.state = {
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
        const slides = [nemesis1]

        return(
            <SliderBox
                resizeMethod={'resize'}
                resizeMode={"cover"}

                images={slides}
            >

            </SliderBox>
        )
    }

    render = () =>{
        const { boss } = this.state

        if(boss){
            return(
                <>
                    <CardView
                        cardElevaton={2}
                        cornerRadius={0}
                    >
                        {this.showSlides()}
                        <BossNameDetonated>{boss.enemy.name}</BossNameDetonated>                                               
                    </CardView>
                    <Card>
                        <CardContent>
                            <BossDetonatedDescription>{boss.enemy.detonated}</BossDetonatedDescription>
                        </CardContent>
                    </Card>
                </>
            )
        } else{
            return null
        }
    }
}