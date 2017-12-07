# Esse arquivo é responsável por configurar seu aplicativo
#  e suas dependências com o auxílio do módulo Mix.Config.
use Mix.Config

# Esta configuração é carregada antes de qualquer dependência e é restrita
# para este projeto. Se outro projeto depende desse projeto, isse
# arquivo não será carregado nem afetará o projeto pai. Por esta razão,
#  se você quiser fornecer valores padrão para seu aplicativo para
# usuários de terceiros, isso deve ser feito no seu arquivo "mix.exs".

# Você pode configurar seu aplicativo como:
#
#     config :financeiro, key: :value
#
# e acessar essa configuração no seu aplicativo como:
#
#     Application.get_env(:financeiro, :key)
#
# Você também pode configurar um aplicativo de terceiros:
#
#     config :logger, level: :info
#

# Também é possível importar arquivos de configuração, relativos a este
# diretório. Por exemplo, você pode emular a configuração por ambiente
# descomentando a linha abaixo e definindo dev.exs, test.exs e tal.
# A configuração do arquivo importado substituirá os definidos
# aqui (e é por isso que é importante importá-los por último).
#
#     import_config "#{Mix.env}.exs"
