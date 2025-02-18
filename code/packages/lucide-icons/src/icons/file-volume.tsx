import React from "react";
import PropTypes from 'prop-types';
import type { IconProps } from '@tamagui/helpers-icon';
import {
  Svg,
  Circle as _Circle,
  Ellipse,
  G,
  LinearGradient,
  RadialGradient,
  Line,
  Path,
  Polygon,
  Polyline,
  Rect,
  Symbol,
  Text as _Text,
  Use,
  Defs,
  Stop } from
'react-native-svg';
import { themed } from '@tamagui/helpers-icon';

const Icon = (props) => {
  const { color = 'black', size = 24, ...otherProps } = props;
  return (
    <Svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke={color}
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      {...otherProps}>

      <Path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v3" stroke={color} />
      <Path d="M14 2v4a2 2 0 0 0 2 2h4" stroke={color} />
      <Path d="m7 10-3 2H2v4h2l3 2Z" stroke={color} />
      <Path d="M11 11a5 5 0 0 1 0 6" stroke={color} />
    </Svg>);

};

Icon.displayName = 'FileVolume';

export const FileVolume = React.memo<IconProps>(themed(Icon));