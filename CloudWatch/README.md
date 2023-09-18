# AWS Auto Scaling
GroupMinSize/ GroupMaxSize : Auto Scaling 그룹의 최소/최대 크기
<br><br>
GroupDesiredCapacity : Auto Scaling 그룹에서 유지 관리를 시도하는 인스턴스의 수
<br><br>
GroupServiceInstances : Auto Scaling그룹의 일부로 실행되는 인스턴스의 수
<br><br>
GroupPendingInstances : 아직 실행되지 않은 인스턴스의 수
<br><br>
GroupStandbtInstances : Standby 상태에 있는 인스턴스의 수
<br><br>
GroupTerminatingInstances : 종료 중인 인스턴스의 수
<br><br>



# Amazon Ec2
CPUUtilization : 인스턴스에서 현재 사용 중인 할당된 EC2 컴퓨팅 유닛의 비율
<br><br>
DiskReadOps : 인스턴스에 사용할 수 있는 스토어 볼륨에서 읽기 성능 
<br><br>
DiskWriteOps : 인스턴스에 사용할 수 있는 스토어 볼륨에서 쓰가 성능 
<br><br>
DiskReadBytes : 인스턴스에 사용할 수 있는 스토어 볼륨에서 읽은 바이트 수 
<br><br>
DiskWriteBytes : 인스턴스에 사용할 수 있는 스토어 볼륨에서 쓴 바이트 수 
<br><br>
NetworkIn : 인스턴스가 네트워크 인터페이스를 통해 받은 바이트 수 
<br><br>
NetworkOut : 인스턴스가 네트워크 인터페이스를 통해 보낸 바이트 수 
<br><br>
NetworkPacketsIn : 인스턴스가 네트워크 인터페이스를 통해 받은 패킷 수 
<br><br>
NetworkPacketsOut : 인스턴스가 네트워크 인터페이스를 통해 보낸 패킷 수 



# ELB
BackendConnectionErros : 로드 밸런서와 등록된 인스턴스 사이에 성공적으로 구성되지 않은 연결 수 
<br><br>
HealthHostCount : 로드 밸런서에 등록된 정상 상태의 인스턴스 수 
<br><br>
HTTPCode_Backend_XXX : 등록된 인스턴스에서 생성된 HTTP 응답 코드 수 
<br><br>
HTTPCode_ELB_4XX : 로드 밸런서에서 생성된 HTTP 4XX 클라이언트 오류 코드 수 
<br><br>
HTTPCode_ELB_5XX : 로드 밸런서에서 생성된 HTTP 5XX 서버 오류 코드 수 
<br><br>
Latency : 로드 밸런서가 등록된 인스턴스에 요청을 보낸 시간부터 인스턴스가 응답 헤더를 보내기 시작할때까지의 총 경과 시간 
<br><br>
RequestsCount : 지정한 주기(1분 또는 5분)에 완료된 요청 또는 연결 수 
<br><br>
SpiloverCount : 서지 대기열이 가득 찼기 때문에 거부된 요청 수 
<br><br>
SugreQueueLength : 정상 인스턴스 대상으로 라우팅이 보류 중인 총 요청 또는 연결 수 



# Amazon RDS
CPUUtilization : CPU 사용 백분율 
<br><br>
DatabaseConnections : 사용 중인 데이터베이스 연결 수 
<br><br>
DiskQueueDepth : 디스크 엑세스를 대기 중인 I/O (읽기/쓰기 요청) 수 
<br><br>
FailedSQLServerAgentJobsCount : 최근 1분간 실패한 SQL Server 에이전트 작업의 수 
<br><br>
NetworkReceiveThroughput : DB 인스턴스 수신 네트워크 트래픽 
<br><br>
NetworkTransmitThroughput : DB 인스턴스 송신 네트워크 트래픽 
<br><br>
ReadIOPS : 초당 평균 디스크 읽기 I/O 연산 수 
<br><br>
ReadLatency : 디스크 I/O 연산당 평균 처리 시간 
<br><br>
ReadThroughput : 초당 디스크에서 읽은 평균 바이트 수 
<br><br>
SwapUsage : DB 인스턴스에서 사용된 스왑 공간 크기 
<br><br>
WriteIOPS : 초당 평균 디스크 쓰기 I/O 연산 수 
<br><br>
WriteLatency : 디스크 I/O 연산당 평균 처리 시간 
<br><br>
WriteThroughput : 초당 디스크에 쓴 평균 바이트 수 
