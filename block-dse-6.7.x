#!/usr/bin/env bash
block_array_blockAbout(){ bbA_blockAbout["block_blockName"]="block-dse-6.7.x";bbA_blockAbout["block_version"]="0.9.1";bbA_blockAbout["block_author"]="jon dowson";bbA_blockAbout["block_url"]="https://github.com/bash-blocks/block-dse-6.7.x";bbA_blockAbout["block_sudo"]="root access is not a prerequisite";bbA_blockAbout["block_dependency_1"]="dse 6.7.x tarball";bbA_blockAbout["block_description_1"]="a minimised 'block' for use with the 'bash-blocks' framework";bbA_blockAbout["block_description_2"]="tested to work on Ubuntu, Centos and Mac";bbA_blockAbout["block_description_3"]="deploy, extract and configure a dse 6.7.x tarball to one or more machines";bbA_blockAbout["block_description_4"]="commands to stop / restart sets of nodes or data-centers";bbA_blockAbout["block_description_5"]="no dependencies to install - only requires dse 6.7.x tarball";bbA_blockAbout["block_description_6"]="typical dse settings configurable through a single json definition file";bbA_blockAbout["block_description_7"]="all other settings can be manipulated via the build folder";};block_array_blockBuildStripExtensions(){ bba_blockBuildStripExtensions[0]="zip";bba_blockBuildStripExtensions[1]="gz";bba_blockBuildStripExtensions[2]="jar";bba_blockBuildStripExtensions[3]="jar.*";bba_blockBuildStripExtensions[4]="md";bba_blockBuildStripExtensions[5]="so.*";bba_blockBuildStripExtensions[6]="so";bba_blockBuildStripExtensions[7]="js";bba_blockBuildStripExtensions[8]="a";bba_blockBuildStripExtensions[9]="py";bba_blockBuildStripExtensions[10]="R";bba_blockBuildStripExtensions[11]="rds";bba_blockBuildStripExtensions[12]="rdx";bba_blockBuildStripExtensions[13]="rdb";bba_blockBuildStripExtensions[14]="sl";bba_blockBuildStripExtensions[15]="dylib";bba_blockBuildStripExtensions[16]="dll";bba_blockBuildStripExtensions[17]="txt";bba_blockBuildStripExtensions[18]="data";bba_blockBuildStripExtensions[19]="html";bba_blockBuildStripExtensions[20]="css";bba_blockBuildStripExtensions[21]="csv";bba_blockBuildStripExtensions[22]="png";bba_blockBuildStripExtensions[23]="gif";bba_blockBuildStripExtensions[24]="jpg";bba_blockBuildStripExtensions[25]="svg";bba_blockBuildStripExtensions[26]="jsp";bba_blockBuildStripExtensions[27]="kryo";bba_blockBuildStripExtensions[28]="ico";bba_blockBuildStripExtensions[29]="war";};block_array_blockPathWriteTest(){ bbA_blockPathWriteTest["connect_installFolder"]="connect";bbA_blockPathWriteTest["connect_targetFolder"]="connect";bbA_blockPathWriteTest["cassandra_tempFolder"]="cassandra";bbA_blockPathWriteTest["cassandra_logFolder"]="cassandra";bbA_blockPathWriteTest["cassandra_commitlogFolder"]="cassandra";bbA_blockPathWriteTest["cassandra_hintedhandoffFolder"]="cassandra";bbA_blockPathWriteTest["cassandra_savedcachesFolder"]="cassandra";bbA_blockPathWriteTest["cassandra_cdcrawFolder"]="cassandra";bbA_blockPathWriteTest["spark_masterlogFolder"]="spark";bbA_blockPathWriteTest["spark_workerlogFolder"]="spark";bbA_blockPathWriteTest["spark_localdataFolder"]="spark";bbA_blockPathWriteTest["spark_executorFolder"]="spark";bbA_blockPathWriteTest["spark_workerdataFolder"]="spark";bbA_blockPathWriteTest["spark_alwaysonsqlFolder"]="spark";bbA_blockPathWriteTest["gremlin_logFolder"]="gremlin";bbA_blockPathWriteTest["dsefs_workFolder"]="dsefs";bbA_blockPathWriteTest["tomcat_logFolder"]="tomcat";bbA_blockPathWriteTest["dse_installFolder"]="dse";bbA_blockPathWriteTest["dse_softwareFolder"]="dse";};block_array_blockPathWriteTestNested(){ bbA_blockPathWriteTestNested["dsefs_dsefs*_folder"]="dsefs";bbA_blockPathWriteTestNested["cassandra_sstableFolders"]="cassandra";};block_array_blockSettings(){ bbA_blockSettings["bld_makeBuildFolder"]="false";bbA_blockSettings["bld_sendBlockSware"]="true";};block_array_blockStages(){ bba_blockStages[1]="bb_STAGE_buildFolder";bba_blockStages[2]="bb_STAGE_testSsh";bba_blockStages[3]="bb_STAGE_testWritePaths";bba_blockStages[4]="bb_STAGE_sendBashBlocks";bba_blockStages[5]="bb_STAGE_sendBlockSware";bba_blockStages[6]="bb_STAGE_deployBlock";bba_blockStages[7]="bb_STAGE_finalStage";bba_blockStages[8]="STAGE_dseStop";bba_blockStages[9]="STAGE_dseStart";bba_blockStages[10]="STAGE_finalStage_startStopDse";bba_blockStages[11]="STAGE_finalStage_installDse";};block_help_block(){ bb_display_msgColor "TASK==>_mc" "Flags: ${build_block}" "" "2" "0" "1";printf "%s\n" "----------------------------------------------------------------------------------------------";printf "%s\n" ".. rolling stop/start of dse                  | -cs --clusterstate       |  restart";printf "%s\n" ".. rolling stop of dse                        | -cs --clusterstate       |  stop";printf "%s\n" "----------------------------------------------------------------------------------------------";printf "%s\n" "${b}examples:${reset}";printf "%s\n" "${yellow}$ bb -b block-dse-6.7.x -s acme_preprod.json -sbs false -mbf true${reset}  //do not send block software + remake the build folder";printf "%s\n" "${yellow}$ bb -b block-dse-6.7.x -s acme_preprod.json -mbf edit${reset}             //exit after -mbf stage to allow manual editing of build folder files";printf "%s\n" "${yellow}$ bb -b block-dse-6.7.x -s acme_preprod.json -cs restart${reset}           //restart dse processes";printf "%s\n" "----------------------------------------------------------------------------------------------";bb_display_msgColor "TASK==>_mc" "Stages: ${build_block}" "" "2" "0" "1";local count=1;for s in "${bba_blockStages[@]}";do printf "%s%s\n" "[${count}] " "${s}";((count++));done;printf "%s\n" "----------------------------------------------------------------------------------------------";};block_flag_handle(){ thisFunc=${FUNCNAME[0]};flag=${1};value=${2};while test $# -gt 0;do case "$flag" in -cs|--clusterstate) bb_array_blockSettingsSet "block_clusterState" "${value}";bb_array_blockSettingsSet "block_switch_clusterState" "true";break ;; *) printf "%s\n";bb_error_standard "not a recognised flag ${flag}" "1" "${thisFunc}: line - ${LINENO}" "true" ;; esac;done;};block_flag_rules(){ thisFunc=${FUNCNAME[0]};errMsg_display=" ${reset}${b}--> see help:${cyan} bb --block ${build_block} --help${reset}";errMsg_default="must supply the correct combination of flags and values ${displayMsg}";errMsg_clusterState="must specify --clusterstate | -cs as either ${yellow}stop${red} or ${yellow}restart${red} or ${yellow}stop-agent${red} or ${yellow}restart-agent${red}";if [[ "${block_switch_clusterState}" == "true" ]];then if [[ "${bbv_switch_sendBlockSware}" == "true" ]]||[[ "${block_switch_makebuildfolder}" == "true" ]];then bb_error_standard "${errMsg_default}" "1" "${thisFunc}: line - ${LINENO}" "true";elif [[ "${block_clusterState}" != "stop" ]]&&[[ "${block_clusterState}" != "restart" ]];then bb_error_standard "${errMsg_clusterState}" "1" "${thisFunc}: line - ${LINENO}" "true";fi;else if [[ "${block_switch_makebuildfolder}" == "true" ]]&&[[ "${bld_makeBuildFolder}" != "true" ]]&&[[ "${bld_makeBuildFolder}" != "false" ]]&&[[ "${bld_makeBuildFolder}" != "edit" ]];then bb_error_standard "${defaultErrMsg}" "1" "${thisFunc}: line - ${LINENO}" "true";fi;fi;};block_ssh_bashProfileAgentStartFlags(){ dseFlags="";if [[ "${dse_mode_search}" == "true" ]];then dseFlags="${dseFlags} -s";fi;if [[ "${dse_mode_analytics}" == "true" ]];then dseFlags="${dseFlags} -k";fi;if [[ "${dse_mode_graph}" == "true" ]];then dseFlags="${dseFlags} -g";fi;bbA_blockSettings[dseFlags]="${dseFlags}";if [[ ${bbv_os} == "Mac" ]];then bashProfilePath="/Users/${connect_sshUser}/.bash_profile";else bashProfilePath="/home/${connect_sshUser}/.bash_profile";fi;file="${bashProfilePath}";label="dseFlags_bash_profile";block=$(printf %q "export dseFlags=\"$(echo ${bbA_blockSettings[dseFlags]})\"");payload1="${file} ${label} ${block} ${build_block}";payload2="${file} ${label} ${block}";remoteCall="${connect_targetFolder}bash-blocks/framework/bb ${bbv_os} ${connect_targetFolder} ${build_block} ${editFile} ${label} ${codeblock}";ssh -ttq -o "BatchMode yes" -o "ForwardX11=no" ${connect_sshUser}@${connect_pubIp} "chmod 755 ${remoteScript} && ${remoteCall} ${payload1}">/dev/null 2>&1;};block_ssh_dseKill(){ ssh -q -i ${connect_sshKeyLocal} ${connect_sshUser}@${connect_pubIp} "ps aux | grep -v grep | grep -v '\-b\ dse' | grep -v '\--block\ dse' | grep cassandra | awk {'print \$2'} | xargs kill -9 &>/dev/null";printf "%s" "${?}";};block_ssh_dseStart(){ dseBin="${dse_installFolder}bin/";start_dse="source ~/.bash_profile && ${dseBin}dse cassandra $(echo ${bbA_blockSettings[dseFlags]})";status="999";if [[ "${status}" != "0" ]];then retry=0;until [[ "${retry}" == "2" ]];do if [[ "${remote_os}" == "Mac" ]];then output=$(ssh -i ${connect_sshKeyLocal} ${connect_sshUser}@${connect_pubIp} "export JAVA_HOME=`/usr/libexec/java_home -v 1.8` && ${start_dse}" 2>&1);else output=$(ssh -i ${connect_sshKeyLocal} ${connect_sshUser}@${connect_pubIp} "${start_dse}" 2>&1);fi;status=$?;if [[ "${status}" == "0" ]]&&[[ "${output}" == *"Wait for nodes completed"* ]]||[[ "${output}" == *"Registering current configuration as safe"* ]];then break;else((retry++));fi;done;fi;printf "%s" "${status}";};block_ssh_dseStop(){ stop_cmd="dse cassandra-stop";tmpStatusFile=${bbv_bbPath}.cmdOutput;retry=0;until [[ "${retry}" == "2" ]];do command=$(ssh -q -i ${connect_sshKeyLocal} ${connect_sshUser}@${connect_pubIp} "source ~/.bash_profile && ${stop_cmd}"&>${tmpStatusFile});status=$?;output=$(cat ${tmpStatusFile}&&rm -rf ${tmpStatusFile});if [[ "${status}" == "0" ]]&&[[ "${output}" == "" ]];then break;elif [[ "${output}" == *"Unable to find DSE process"* ]];then status="${output}";break;else((retry++));fi;done;printf "%s" "${status}";};block_file_cassandraEnvironment(){ local file="${bbv_buildFolderPath}resources/cassandra/conf/cassandra-env.sh";local label="define_dse_log_folders";local labelA=$(bb_file_bbCodeTags "labelA" "${build_block}" "${label}");local labelB=$(bb_file_bbCodeTags "labelB" "${build_block}" "${label}");bb_sed_file "del_lineBySubstring" "${file}" "export CASSANDRA_LOG_DIR=";bb_sed_file "del_lineBySubstring" "${file}" "export TOMCAT_LOGS=";bb_sed_file "del_lineBySubstring" "${file}" "export GREMLIN_LOG_DIR=";bb_file_labelledCodeRemove "${file}" "${build_block}" "${label}";unset arrayInsertTheseLines;declare -a arrayInsertTheseLines;arrayInsertTheseLines[0]="${labelA}";arrayInsertTheseLines[1]="export CASSANDRA_LOG_DIR=${cassandra_logFolder}";arrayInsertTheseLines[2]="export TOMCAT_LOGS=${tomcat_logFolder}";arrayInsertTheseLines[3]="export GREMLIN_LOG_DIR=${gremlin_logFolder}";arrayInsertTheseLines[4]="${labelB}";local insertLine="16";local buffer="1";result=$(bb_file_codeInsert "${file}" "${insertLine}" "${buffer}");};block_file_cassandraRackProperties(){ file="${bbv_buildFolderPath}resources/cassandra/conf/cassandra-rackdc.properties";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "dc=" "${cassandra_dc}";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "rack=" "${cassandra_rack}";};block_file_cassandraTopologyProperties(){ topology_file_path="${dse_installFolder}resources/cassandra/conf/cassandra-topology.properties";if [[ "${build_endpointSnitch}" != "PropertyFileSnitch" ]];then mv "${topology_file_path}" "${topology_file_path}_old" 2>/dev/null;fi;};block_file_cassandraYaml(){ file="${bbv_buildFolderPath}resources/cassandra/conf/cassandra.yaml";dynamic_cmd="$(bb_os_command 'gsed -i' 'sed -i' 'sed -i' 'sed -i')";bb_sed_file "set_afterSubstringPathFriendly" ${file} "cluster_name:" "'${build_clusterName}'";if [[ "${build_vnodes}" == "" ]];then bb_sed_file "del_leadingHashAndWhitespace" ${file} "initial_token:";bb_sed_file "set_afterSubstringPathFriendly" ${file} "initial_token:" "${cassandra_token}";bb_sed_file "set_commentOutLineMatchSubstring" ${file} "num_tokens:";bb_sed_file "set_commentOutLineMatchSubstring" ${file} "allocate_tokens_for_local_replication_factor:";else bb_sed_file "del_leadingHashAndWhitespace" ${file} "num_tokens:";bb_sed_file "set_afterSubstringPathFriendly" ${file} "num_tokens:" "${build_vnodes}";bb_sed_file "del_leadingHashAndWhitespace" ${file} "allocate_tokens_for_local_replication_factor:";bb_sed_file "set_commentOutLineMatchSubstring" ${file} "initial_token:";fi;bb_sed_file "set_afterSubstringPathFriendly" ${file} "hints_directory:" "${cassandra_hintedhandoffFolder}";bb_sed_file "set_afterSubstringPathFriendly" ${file} "commitlog_directory:" "${cassandra_commitlogFolder}";bb_sed_file "set_afterSubstringPathFriendly" ${file} "cdc_raw_directory:" "${cassandra_cdcrawFolder}";bb_sed_file "set_afterSubstringPathFriendly" ${file} "saved_caches_directory:" "${cassandra_savedcachesFolder}";bb_sed_file "set_afterSubstringPathFriendly" ${file} "endpoint_snitch:" "${build_endpointSnitch}";${dynamic_cmd} "s?\(-[[:space:]]seeds:\s*\).*\$?\1\"${cassandra_seeds}\"?" "${file}";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "listen_address:" "${cassandra_listenAddress}";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "rpc_address:" "${cassandra_rpcAddress}";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "native_transport_address:" "${cassandra_nativeTransportAddress}";};block_file_cassandraYamlCassData(){ file="${bbv_buildFolderPath}resources/cassandra/conf/cassandra.yaml";match=$(sed -n /data_file_directories:/= "${file}");start=$(($match+1));finish=$(($start+100));for i in $(seq ${start} ${finish});do if [[ ! $(head -$i "${file}"|tail -1|grep '-') ]];then lastEntry=$(($i-1));break;fi;done;dynamic_cmd="$(bb_os_command 'gsed -i' 'sed -i' 'sed -i' 'sed -i')";${dynamic_cmd} "${file}" -re "${start},${lastEntry}d";arrayIndex="0";bb_array_stringDelimeter "," "${cassandra_sstableFolders}";unset arrayInsertTheseLines;declare -a arrayInsertTheseLines;for f in "${bba_temp[@]}";do value=$(bb_json_replaceVariables ${f});arrayInsertTheseLines[${arrayIndex}]="\ \ \ \ -\ ${value}";((arrayIndex++));done;insertFile="${file}";insertAction="${start}";result=$(bb_file_codeInsert "${insertFile}" "${insertAction}" "0");};block_file_dseGremlinRemoteYaml(){ graphNodesList="";for id in $(seq 1 ${bbv_numberOfServers});do if [[ "${dse_mode_graph}" == "true" ]];then if [[ "${graphNodesList}" == "" ]];then graphNodesList=${connect_pubIp};else graphNodesList=${graphNodesList},${connect_pubIp};fi;fi;done;if [[ "${graphNodesList}" == "" ]];then graphNodesList=$(printf "%s" "[localhost]");else graphNodesList=$(printf "%s" "[${graphNodesList}]");fi;file="${bbv_buildFolderPath}resources/graph/gremlin-console/conf/remote.yaml";bb_sed_file "set_afterSubstringPathFriendly" "${file}" "hosts:" "${graphNodesList}";};block_file_dseSparkEnv(){ local file="${bbv_buildFolderPath}resources/spark/conf/dse-spark-env.sh";local label="define_spark_folders";local labelA=$(bb_file_bbCodeTags "labelA" "${build_block}" "${label}");local labelB=$(bb_file_bbCodeTags "labelB" "${build_block}" "${label}");bb_sed_file "del_lineBySubstring" "${file}" "-Djna.tmpdir=";bb_file_labelledCodeRemove "${file}" "${build_block}" "${label}";unset arrayInsertTheseLines;declare -a arrayInsertTheseLines;arrayInsertTheseLines[0]="${labelA}";arrayInsertTheseLines[1]="export SPARK_LOCAL_DIRS=${spark_localdataFolder}";arrayInsertTheseLines[2]="export SPARK_WORKER_DIR=${spark_workerdataFolder}";arrayInsertTheseLines[3]="export SPARK_EXECUTOR_DIRS=${spark_executorFolder}";arrayInsertTheseLines[4]="export SPARK_WORKER_LOG_DIR=${spark_workerlogFolder}";arrayInsertTheseLines[5]="export SPARK_MASTER_LOG_DIR=${spark_masterlogFolder}";arrayInsertTheseLines[6]="export ALWAYSON_SQL_LOG_DIR=${spark_alwaysonsqlFolder}";arrayInsertTheseLines[7]="${labelB}";local insertLine="2";local buffer="1";result=$(bb_file_codeInsert "${file}" "${insertLine}" "${buffer}");};block_file_dseYamlDsefsData(){ file="${bbv_buildFolderPath}resources/dse/conf/dse.yaml";label="define_dsefs_options";bb_file_labelledCodeRemove "${file}" "${build_block}" "${label}";gsed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' -i "${file}";gsed -e :a -e '/^[[:blank:]]\n*$/{$d;N;};/\n$/ba' -i "${file}";beginMsg=$(bb_file_bbCodeTags "labelA" "${build_block}" "${label}")"";endMsg=$(bb_file_bbCodeTags "labelB" "${build_block}" "${label}");if [[ ${dse_mode_analytics} == "true" ]];then dse_mode_dsefs="true";bbA_jsonCurrentLoopServer["dse_mode_dsefs"]="true";bbA_jsonAllServers["server_${loopServerId}_dse_mode_dsefs"]="true";fi;unset arrayInsertTheseLines;declare -a arrayInsertTheseLines;arrayInsertTheseLines[0]="${beginMsg}";arrayInsertTheseLines[1]="dsefs_options:";arrayInsertTheseLines[2]="\ \ \ enabled: ${dse_mode_dsefs}";arrayInsertTheseLines[3]="\ \ \ keyspace_name: dsefs";arrayInsertTheseLines[4]="\ \ \ work_dir: ${dsefs_workFolder}";arrayInsertTheseLines[5]="\ \ \ public_port: 5598";arrayInsertTheseLines[6]="\ \ \ private_port: 5599";arrayInsertTheseLines[7]="\ \ \ data_directories:";arrayIndex=${#arrayInsertTheseLines[@]};varStem="dsefs_dsefs";noFolders=$(${bbv_jqFilePath} -r '.servers.server'${loopServerId}'.dsefs|keys[]' ${bbv_jsonServersPath}|wc -l);((noFolders--));for d in $(seq 1 "${noFolders}");do dirpath="${varStem}${d}_folder";sweight="${varStem}${d}_storageWeight";minspace="${varStem}${d}_minFreeSpace";dirpath="${!dirpath}";sweight="${!sweight}";minspace="${!minspace}";arrayInsertTheseLines[${arrayIndex}]="\ \ \ - dir: ${dirpath}";((arrayIndex++));arrayInsertTheseLines[${arrayIndex}]="\ \ \ \ \ storage_weight: ${sweight}";((arrayIndex++));arrayInsertTheseLines[${arrayIndex}]="\ \ \ \ \ min_free_space: ${minspace}";((arrayIndex++));done;arrayInsertTheseLines[${arrayIndex}]="${endMsg}";insertFile="${file}";insertAction="append";result=$(bb_file_codeInsert "${insertFile}" "${insertAction}" "1");};block_file_jvmOptions(){ local file="${bbv_buildFolderPath}resources/cassandra/conf/jvm.options";local label="define_jvm_log_options";local labelA=$(bb_file_bbCodeTags "labelA" "${build_block}" "${label}");local labelB=$(bb_file_bbCodeTags "labelB" "${build_block}" "${label}");bb_sed_file "del_lineBySubstring" "${file}" "-Djna.tmpdir=";bb_file_labelledCodeRemove "${file}" "${build_block}" "${label}";unset arrayInsertTheseLines;declare -a arrayInsertTheseLines;arrayInsertTheseLines[0]="${labelA}";arrayInsertTheseLines[1]="-Djna.tmpdir=${cassandra_tempFolder}";arrayInsertTheseLines[2]="${labelB}";local buffer="1";result=$(bb_file_codeInsert "${file}" "append" "${buffer}");};block_file_mergeResourcesFolder(){ cp -R "${bbv_buildFolderPath}resources" "${dse_installFolder}";};STAGE_deployBlock(){ thisFunc=${FUNCNAME[0]};bb_json_recursiveArrays "${loopServerId}" "${bbv_jsonServersPath}";bb_array_declareJsonCurrentLoopServer;if [[ "${bbv_remoteMode}" == "adhoc" ]];then "${bbv_adhoc}";exit 0;else for f in "${bba_blockSoftware[@]}";do bb_filesFolders_fileFolderExists "dse software ${f} not found in ${dse_softwareFolder}" "${thisFunc}: line - ${LINENO}" "1" "true" "${dse_softwareFolder}" "file" "${f}";done;dseUnpack="${dse_softwareFolder}${build_tarballDse}";if [[ "${bbd_debug}" == "true" ]];then bb_debug_thisVar "extraction path for dse tarball" "dseUnpack" "${dseUnpack}";bb_debug_thisVar "install folder for extracted files" "connect_installFolder" "${connect_installFolder}";fi;rm -rf ${connect_installFolder}${build_versionDse};declare -a bla_remoteFunctions;bla_remoteFunctions[0]="bb_file_unpackTar ${dseUnpack}   ${connect_installFolder}";bla_remoteFunctions[1]="block_file_cassandraEnvironment";bla_remoteFunctions[2]="block_file_jvmOptions";bla_remoteFunctions[3]="block_file_dseSparkEnv";bla_remoteFunctions[4]="block_file_cassandraYaml";bla_remoteFunctions[5]="block_file_cassandraRackProperties";bla_remoteFunctions[6]="block_file_cassandraYamlCassData";bla_remoteFunctions[7]="block_file_dseYamlDsefsData";bla_remoteFunctions[8]="block_file_dseGremlinRemoteYaml";bla_remoteFunctions[9]="bb_bash_configProfile CASSANDRA_HOME ${dse_installFolder}bin dse";bla_remoteFunctions[10]="block_file_mergeResourcesFolder";bla_remoteFunctions[11]="block_file_cassandraTopologyProperties";for func in "${!bla_remoteFunctions[@]}";do ${bla_remoteFunctions[$func]};done;bb_bash_configProfile "bb_HOME" "${bbv_bbPath}" "bb";fi;};STAGE_dseStart(){ stageNumber="${1}";stageTotal="${2}";bb_display_bbBanner "start dse" "synchronous" "${stageNumber}" "${stageTotal}";bb_loop_servers "STAGE_dseStart_task" "dse processes have started" "false";bb_time_stageTimer;};STAGE_dseStart_task(){ bb_display_msgColor "TASK==>_mc" "TASK: starting dse" "" "1" "1" "1";bb_display_msgColor "INFO-B-->_mc" "on server:" "${onServer}" "2" "0" "1";bb_json_recursiveArrays "${loopServerId}" "${bbv_jsonServersPath}";bb_array_declareJsonCurrentLoopServer;bb_display_msgColor "INFO-B-->_mc" "checking java:" "" "2" "0" "1";javaVersion=$(bb_java_getVersion);if [[ "${javaVersion}" == "" ]]||[[ "${javaVersion}" == "no jvm found" ]]||[[ "${javaVersion}" == "java not installed" ]]||[[ "${javaVersion}" != *"1.8"* ]];then printf "%s\n" "${red}${javaVersion}${reset}";if [[ "${bbd_abortOnFail}" == "true" ]];then errMsg="now exiting due to lack of java 8 on server ${connect_tag}";bb_error_standard "${errMsg}" "1" "${thisFunc}: line - ${LINENO}" "${bbd_abortOnFail}";else errMsg="due to lack of java 8, cannot continue to start dse on server ${connect_tag}";bb_error_standard "${errMsg}" "1" "${thisFunc}: line - ${LINENO}" "false";fi;else printf "%s\n" "${magenta}${javaVersion}${reset}";bb_display_msgColor "INFO-B-->_mc" "new dse version:" "${build_versionDse}" "1" "0" "1";bbA_blockSettings[dseFlags]="";block_ssh_bashProfileAgentStartFlags;if [[ "$(echo ${bbA_blockSettings[dseFlags]})" == "" ]];then bb_display_msgColor "INFO-B-->_mc" "starting dse:" "~45s [storage only]" "1" "0" "1";else bb_display_msgColor "INFO-B-->_mc" "starting dse:" "~45s [storage + flags $(echo ${bbA_blockSettings[dseFlags]})]" "1" "0" "1";fi;dseStartStatus=$(block_ssh_dseStart);if [[ "${dseStartStatus}" == "0" ]];then bb_display_msgColor "INFO-->_mc" "${green}${dseStartStatus}${reset}" "" "2" "0" "0";bbA_taskActions["rollingStartDse: success with starting dse on: ${onServer}"]="${dseStartStatus}";else bb_display_msgColor "CROSS-->_mc" "failed to start dse" "" "1" "0" "0";bbA_taskActions["rollingStartDse: failure to start dse on: ${onServer}"]="${dseStartStatus}";fi;fi;};STAGE_dseStart_task_report(){ bb_loop_taskReport "start dse:" "dse started";};STAGE_dseStop(){ stageNumber="${1}";stageTotal="${2}";bb_display_bbBanner "stop dse" "synchronous" "${stageNumber}" "${stageTotal}";bb_loop_servers "STAGE_dseStop_task" "dse processes have stopped" "false";bb_time_stageTimer;};STAGE_dseStop_task(){ bb_display_msgColor "TASK==>_mc" "TASK: stop dse" "-" "1" "1" "1";result=$(bb_ssh_getSwareVersionFromPid "dse-" "_");bb_display_msgColor "INFO-B-->_mc" "on server:" "${onServer}" "2" "0" "1";bb_display_msgColor "INFO-B-->_mc" "old version:" "${result}" "1" "0" "1";bb_display_msgColor "INFO-B-->_mc" "graceful stop:" "~30s" "1" "0" "1";bb_json_recursiveArrays "${loopServerId}" "${bbv_jsonServersPath}";bb_array_declareJsonCurrentLoopServer;dseStopStatus=$(block_ssh_dseStop);if [[ "${dseStopStatus}" != "0" ]];then bb_display_msgColor "INFO-B-->_mc" "ungraceful stop:" "will now search and stop any running cassandra pids" "1" "0" "1";status=$(block_ssh_dseKill);if [[ "${status}" == "0" ]];then bb_display_msgColor "INFO-->_mc" "${green}${status}${reset}" "" "2" "0" "0";else bb_display_msgColor "ALERT-->_mc" "pid kill command failed!" "" "2" "0" "0";bbA_taskActions["rollingStopDse: failure to find any dse running pids on: ${onServer} with code ${red}${status}"]="${status}";fi;bbA_taskActions["rollingStopDse: failure to find any dse running pids on: ${onServer} with code ${red}${status}"]="${status}";else bb_display_msgColor "INFO-->_mc" "${green}${dseStopStatus}${reset}" "" "2" "0" "0";bbA_taskActions["rollingStopDse: success with stopping dse gracefully on: ${onServer}"]="${dseStopStatus}";fi;};STAGE_dseStop_task_report(){ bb_loop_taskReport "stop dse:" "dse stopped";};STAGE_finalStage_installDse(){ bb_display_msgColor "TASK==>_mc" "TASK: final block messages" "" "1" "1" "1";bb_display_msgColor "INFO-BY-->_mc" "(1) source '.bash_profile' (or open new terminal):" "" "2" "0" "1";bb_display_msgColor "INFO-->_mc" "$ . ~/.bash_profile" "" "2" "0" "1";bb_display_msgColor "INFO-BY-->_mc" "(2) start cluster (DSE workload determined by mode settings in json file)" "" "2" "0" "1";bb_display_msgColor "INFO-->_mc" "$ bb --block ${build_block} --servers ${bbv_jsonServers} --clusterstate restart" "" "2" "0" "1";};STAGE_finalStage_startStopDse(){ bb_display_msgColor "TASK==>_mc" "TASK: final block messages" "" "1" "1" "1";bb_display_msgColor "INFO-BY-->_mc" "(1) To check status of cluster" "" "2" "0" "1";bb_display_msgColor "INFO-->_mc" "$ dse nodetool status" "" "2" "0" "1";bb_display_msgColor "INFO-->_mc" "$ dsetool ring" "" "2" "0" "1";};block-dse-6.7.x(){ thisFunc=${FUNCNAME[0]};bbA_blockSettings["dseFlags"]="";bba_blockSoftware[0]="${build_tarballDse}";bbv_buildSware="${build_tarballDse}";bbv_buildSwareFolder="${build_versionDse}";bbv_buildSwareFolderSubFolderPath="resources";for f in "${bba_blockSoftware[@]}";do blockSwareFolder="${bbv_targetFolder_hostMachine}bash-blocks/blocks/${build_block}/software/";errMsg="dse software ${f} not found in ${blockSwareFolder}";callMsg="${thisFunc}: line - ${LINENO}";returnCode="1";abortOnFail="true";path="${blockSwareFolder}";fileOrFolder="file";fileToCheck="${f}";bb_filesFolders_fileFolderExists "${errMsg}" "${callMsg}" "${returnCode}" "${abortOnFail}" "${path}" "${fileOrFolder}" "${fileToCheck}";done;if [[ "${bbd_debug}" == "true" ]];then bb_debug_blockLocalSetup;fi;if [[ "${bbv_switch_stageSet}" == "true" ]];then blv_noOfStages=${#bba_stageSet[@]};elif [[ "${block_switch_clusterState}" == "true" ]]&&[[ "${block_clusterState}" == "stop" ]];then bba_stageSet=(2 8 7 10);blv_noOfStages=${#bba_stageSet[@]};((blv_noOfStages--));elif [[ "${block_switch_clusterState}" == "true" ]]&&[[ "${block_clusterState}" == "restart" ]];then bba_stageSet=(2 8 9 7 10);blv_noOfStages=${#bba_stageSet[@]};((blv_noOfStages--));else bba_stageSet=(1 2 3 4 5 6 7 11);blv_noOfStages=${#bba_stageSet[@]};((blv_noOfStages--));fi;local STAGECOUNT_mc=1;for stage in "${bba_stageSet[@]}";do ${bba_blockStages[$stage]} "${STAGECOUNT_mc}" "${blv_noOfStages}";((STAGECOUNT_mc++));done;};