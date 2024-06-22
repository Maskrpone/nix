const hyprland = await Service.import('hyprland');

const changeWorkspace = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

const activeWorkspace = Variable('init', {
  listen: '/tmp/workspaces',
})

// const getWorkspaces = (ws) => {
//   console.log("active : " + hyprland.active.workspace.);
//   // console.log("current :" + eval())
//   return 'test'
// }

// const workspace = Widget.EventBox({
//   onScrollUp: () => changeWorkspace('+1'),
//   onScrollDown: () => changeWorkspace('-1'),
//   child: Widget.Box({
//     children: Array.from({ length: 10 }, (_,i) => i + 1).map(i => Widget.Button({
//       attribute: i,
//       // label: (i == hyprland.active.workspace.bind("name") ? "󱨇" : "󱓼",
//       label: hyprland.active.workspace.bind('name').as(name => return (name)),
//       // label:gcc,
//       onClicked: () => changeWorkspace(i),
//     })),
//   })
// });

const workspace = Widget.EventBox({
  onScrollUp: () => changeWorkspace('+1'),
  onScrollDown: () => changeWorkspace('-1'),
  child: Widget.Button({
    label: activeWorkspace.bind(),
    onClicked: () => console.log('Clicked'),
  })
})


export { hyprland, workspace }
