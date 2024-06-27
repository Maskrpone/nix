const hyprland = await Service.import('hyprland');

const changeWorkspace = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

const activeWorkspace = Variable('init', {
  listen: '/tmp/workspaces',
})

function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
        })))

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}

// const workspace = Widget.EventBox({
//   onScrollUp: () => changeWorkspace('+1'),
//   onScrollDown: () => changeWorkspace('-1'),
//   child: Widget.Button({
//     label: activeWorkspace.bind(),
//     onClicked: () => console.log('Clicked'),
//   })
// })


export { hyprland, workspace }
