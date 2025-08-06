import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:mdk_on_air/util/drift.dart';

class ConfigurationDialog extends StatefulWidget {
  final BasicInfoData? initialData;
  final void Function(BasicInfoCompanion data) onSave;

  const ConfigurationDialog({Key? key, this.initialData, required this.onSave})
    : super(key: key);

  @override
  State<ConfigurationDialog> createState() => _ConfigurationDialogState();
}

class _ConfigurationDialogState extends State<ConfigurationDialog> {
  late TextEditingController _deviceIdController;
  late TextEditingController _deviceNameController;
  late TextEditingController _sensorNameController;
  late TextEditingController _wifiNameController;
  late TextEditingController _serverIpController;
  late TextEditingController _serverMqttPortController;
  late TextEditingController _serverMqttIdController;
  late TextEditingController _serverMqttPasswordController;

  @override
  void initState() {
    super.initState();
    _deviceIdController = TextEditingController(
      text: widget.initialData?.deviceId ?? 'ghu-studio-onair1',
    );
    _deviceNameController = TextEditingController(
      text: widget.initialData?.deviceName ?? 'ON_AIR_1',
    );
    _sensorNameController = TextEditingController(
      text: widget.initialData?.sensorName ?? 'sensor1',
    );
    _wifiNameController = TextEditingController(
      text: widget.initialData?.wifiName ?? 'mdk',
    );
    _serverIpController = TextEditingController(
      text: widget.initialData?.serverIp ?? '192.168.11.120',
    );
    _serverMqttPortController = TextEditingController(
      text: widget.initialData?.serverMqttPort.toString() ?? '1883',
    );
    _serverMqttIdController = TextEditingController(
      text: widget.initialData?.serverMqttId ?? 'mdk',
    );
    _serverMqttPasswordController = TextEditingController(
      text: widget.initialData?.serverMqttPassword ?? '12344321',
    );
  }

  @override
  void dispose() {
    _deviceIdController.dispose();
    _deviceNameController.dispose();
    _sensorNameController.dispose();
    _wifiNameController.dispose();
    _serverIpController.dispose();
    _serverMqttPortController.dispose();
    _serverMqttIdController.dispose();
    _serverMqttPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('기본 환경 설정'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(_deviceIdController, '디바이스 ID'),
            _buildTextField(_deviceNameController, '디바이스 이름'),
            _buildTextField(_sensorNameController, '센서 이름'),
            _buildTextField(_wifiNameController, 'Wi-Fi 이름', optional: true),
            const Divider(),
            _buildTextField(_serverIpController, '서버 IP'),
            _buildTextField(_serverMqttPortController, '서버 MQTT 포트'),
            _buildTextField(_serverMqttIdController, '서버 MQTT ID'),
            _buildTextField(_serverMqttPasswordController, '서버 MQTT 비밀번호'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            final companion = BasicInfoCompanion(
              deviceId: drift.Value(_deviceIdController.text.trim()),
              deviceName: drift.Value(_deviceNameController.text.trim()),
              sensorName: drift.Value(_sensorNameController.text.trim()),
              wifiName:
                  _wifiNameController.text.trim().isEmpty
                      ? const drift.Value.absent()
                      : drift.Value(_wifiNameController.text.trim()),
              serverIp: drift.Value(_serverIpController.text.trim()),
              serverMqttPort: drift.Value(
                int.tryParse(_serverMqttPortController.text.trim()) ?? 1883,
              ),
              serverMqttId: drift.Value(_serverMqttIdController.text.trim()),
              serverMqttPassword: drift.Value(
                _serverMqttPasswordController.text.trim(),
              ),
              createdAt: drift.Value(DateTime.now()),
            );
            widget.onSave(companion);
            Navigator.pop(context);
          },
          child: const Text('저장'),
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool optional = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: optional ? '(선택)' : null,
        ),
      ),
    );
  }
}
