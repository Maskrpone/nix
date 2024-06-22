import { hyprland, workspace } from "./workspaces.js";


const getHour = Variable('', {
  poll: [1000, "date +'%H:%M'"],
})

const getBattery = Variable('', {
  poll: [1000, "cat /sys/class/power_supply/BAT0/capacity"],
})

const batteryWidget = Widget.Label({
  label: getBattery.bind()
})

const clockWidget = Widget.Label({
  label: getHour.bind(),
})

const bar = Widget.CenterBox({
  startWidget: workspace,
  centerWidget: clockWidget,
  endWidget: batteryWidget,
})

const myBar = Widget.Window({
    name: 'bar',
    anchor: ['top', 'left', 'right'],
    child: bar,
})

App.config({ windows: [myBar] })
