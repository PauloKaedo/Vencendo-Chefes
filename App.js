import React from 'react'

import { StatusBar } from 'react-native'
import { MenuProvider } from 'react-native-popup-menu'

import BossFeed from './src/screens/BossFeed'
import BossShow from './src/screens/BossShow'
import BossDetonated from './src/screens/BossDetonated'

import { createAppContainer } from 'react-navigation'
import { createStackNavigator } from 'react-navigation-stack'

const Navigator = createStackNavigator(
  {
    BossFeed: {screen : BossFeed},
    BossShow: {screen : BossShow},
    BossDetonated: {screen : BossDetonated}
  }, 
  {
    headerMode: 'none'
  }
)

const Container = createAppContainer(Navigator)

export default function App (){
  return (
    <MenuProvider>
      <StatusBar></StatusBar>
      <Container></Container>
    </MenuProvider>
  )
}