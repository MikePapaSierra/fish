# fish-config

Fish shell configuration

## Custom configuration

Configuration is using [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
and [fisk](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#fisk) theme.

Recently completions for kubectl and helm had been added using ths two repos:
- [fish-kubectl-completions](https://github.com/evanlucas/fish-kubectl-completions)
- [Helm Completion Fish](https://helm.sh/docs/helm/helm_completion_fish/)
- [Minikube Completion](https://minikube.sigs.k8s.io/docs/commands/completion/)

## Plugins

I'm using couple addiltional plugins, and that's just a matter of the
preferances.

Oh-my-fish plugins:
- [plugin-bang-bang](https://github.com/oh-my-fish/plugin-bang-bang) - Bang-bang
  functionality for Fish shell.
- [plugin-aws](https://github.com/oh-my-fish/plugin-aws) - AWS CLI completion
  and profile management.
- [plugin-weather](https://github.com/oh-my-fish/plugin-weather) - display
  current weather in your location.
- [plugin-spark](https://github.com/oh-my-fish/plugin-spark) - Plugin weather
  depends on this plugin.
- [plugin-grc](https://github.com/oh-my-fish/plugin-grc) - support for grc
  colorizer in Fish shell.
- [plugin-battery](https://github.com/oh-my-fish/plugin-battery) - used to display current battery state.

Plugins installed by [Fisher](https://github.com/jorgebucaran/fisher):
- [Z for Fish](https://github.com/jethrokuan/z)
- [Peco](https://github.com/peco/peco)
- [ghq](https://github.com/x-motemen/ghq)

## TODO:

Add information about packages/fonts that need to be installed.
- Exa
- grc
- Nerd Fonts

## Inspiration

My main inspiration to create this configuration was stream one of the AWS developer advocate [Darko Mesaros](https://github.com/darko-mesaros).
Recording from that session can be find [here](https://www.youtube.com/watch?v=kPnYFsXml-I).

## License

This code is distributed on [MIT License](/LICENSE).
