const _hour = Variable("", {
  poll: [1000, 'date +"%H:%M:%S"'],
});

const myLabel = Widget.Label({
  label: _hour.bind(),
});

const myBar = Widget.Window({
  name: "bar",
  anchor: ["top", "left", "right"],
  child: myLabel,
});

App.config({
  style: "./style.css",
  windows: [myBar],
});
