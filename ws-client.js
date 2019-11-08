var urlParams = new URLSearchParams(window.location.search);
var log = urlParams.get('log')

var ws = new WebSocket(`ws://awx-ci-log-server.testing.ansible.com/logs/${log}?tail=1`)
var messages = document.createElement('div');

ws.onmessage = function (event) {
    if (event.data === 'ping') {
        ws.send("pong");
        return
    }

    var message = document.createElement('code');
    var content = document.createTextNode(event.data);

    message.appendChild(content);
    messages.appendChild(message);

    var follow = document.getElementsByName("follow")[0]

    if (follow.checked) {
        messages.scrollIntoView(false);
    }
};

document.body.appendChild(messages);
