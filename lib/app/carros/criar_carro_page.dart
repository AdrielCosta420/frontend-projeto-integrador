import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projeto_integrador4/app/carros/stores/criar_carro_store.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';
import 'package:routefly/routefly.dart';
import '../../common/custom_menu.dart';
import '../../common/custom_text_field.dart';
import '../../injectable.dart';
import '../../routes.dart';

class CriarCarroPage extends StatefulWidget {
  const CriarCarroPage({super.key});

  @override
  State<CriarCarroPage> createState() => _CriarCarroPageState();
}

class _CriarCarroPageState extends State<CriarCarroPage> {
  final store = injector.get<CriarCarroStore>();
  final formKey = GlobalKey<FormState>();

  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController anoFabricacaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController anoModelo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomMenu(
      widget: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .7,
          decoration: BoxDecoration(
            color: Colors.indigo[50],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CADASTRAR NOVO CARRO',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatório.';
                    }
                    return null;
                  },
                  textController: marcaController,
                  label: 'Marca',
                  icon: Icons.brightness_auto_sharp,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatório.';
                    }
                    return null;
                  },
                  textController: modeloController,
                  label: 'Modelo',
                  icon: Icons.star_border_purple500_sharp,
                ),
                CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório.';
                      }
                      return null;
                    },
                    textController: descricaoController,
                    label: 'Descrição',
                    icon: Icons.brightness_auto_sharp),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
                  keyboardType: TextInputType.number,
                  textController: anoFabricacaoController,
                  label: 'Ano de Fabricação',
                  icon: Icons.date_range_outlined,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
                  keyboardType: TextInputType.number,
                  textController: anoModelo,
                  label: 'Ano Modelo',
                  icon: Icons.date_range_outlined,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    String formattedValue = formatarValor(value);
                    if (formattedValue == 'Valor inválido') {
                      return 'Valor inválido';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  textController: valorController,
                  label: 'Valor (R\$)',
                  icon: Icons.price_check_rounded,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Routefly.navigate(routePaths.carros.path),
                      child: const Text('Voltar'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3e20dc),
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          store.createCarro(Car(
                            marca: marcaController.text,
                            modelo: modeloController.text,
                            anoFabricacao:
                                DateTime.parse(anoFabricacaoController.text),
                            anoModelo: DateTime.parse(anoModelo.text),
                            descricao: descricaoController.text,
                            valor: double.tryParse(valorController.text),
                          ));
                          Routefly.navigate(routePaths.carros.path);
                        }
                      },
                      child: const Text(
                        'Criar novo carro',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  String formatarValor(String valor) {
    RegExp regex = RegExp(r'^(\d+)(\.\d+)?');

    if (regex.hasMatch(valor)) {
      String formattedValue = valor.replaceAllMapped(
        RegExp(r'^(\d+)(\.\d+)?'),
        (match) {
          final number = int.parse(match.group(1)!);
          final decimalPart = match.group(2) ?? '';

          final formattedNumber =
              NumberFormat("#,##0.00", "pt_BR").format(number);

          return 'R\$ $formattedNumber$decimalPart';
        },
      );
      return formattedValue;
    } else {
      return 'Valor inválido';
    }
  }
}
